import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:newslash/utils/http_util.dart';
import 'package:newslash/utils/enum_util.dart' as EnumUtil;

class AutoRejectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AutoRejectAppWighet(),
    );
  }
}

class AutoRejectAppWighet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AutoRejectAppStateWidget();
}

class AutoRejectAppStateWidget extends State<AutoRejectAppWighet> {
  var rejectLogs = 'this is log:';
  var rejectItemsNow = 0;
  List widgets = [];
  String rejectSize = '5000';

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        // child: CopyableText("$i、${widgets[i]["title"]}"));
        child: Text(DateTime.now().toString() + ":    ${widgets[i]["title"]}"));
  }

  getBody() {
    if (rejectItemsNow == 2) {
      return getListView();
    } else if (rejectItemsNow == 1) {
      return getProgressDialog();
    } else if (rejectItemsNow == 0) {
      return getNormalNotice();
    }
  }

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  getNormalNotice() {
    return Center(child: Text('Press button to start!'));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'One key to reject out!',
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _onAddFloatingActionPress(context);
        },
      ),
    );
  }

  static List<Map<String, String>> _generHttpPostQueryHeaders() {
    return [
      {
        "Content-Type": "application/json;charset=UTF-8",
        "userName": "%E7%99%BD%E9%9B%AA",
        "userId": "u80645dc73975414eaa1c90eb0f19f41a",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "X-Requested-With",
        "Access-Control-Allow-Methods": "PUT,POST,GET,DELETE,OPTIONS",
        // ignore: equal_keys_in_map
        'Access-Control-Allow-Headers':
            'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild',
        // ignore: equal_keys_in_map
        "Content-Type": "application/json;charset=utf-8"
      }
    ];
  }

  _onAddFloatingActionPress(BuildContext context) {
    setState(() {
      widgets = [];
      rejectItemsNow = 1;
    });
    _searchWaybillByWaybillCode();
  }

  _setLogsData(String logs) {
    setState(() {
      rejectLogs = logs != null ? logs : '';
      widgets.add({"title": rejectLogs});
    });
  }

  _searchWaybillByWaybillCode() {
    var queryParams = {
      'size': rejectSize,
      'current': '1',
      "filter": {
        'waybillCode': "",
        'waybillStatus': 5,
        'mailType': '',
        'searchStartTime': '',
        'searchEndTime': '',
        'consignee': ''
      }
    };
    HttpUtil.init()
        .httpDoPostRequest(
            EnumUtil.QueryNetworkType.Http,
            EnumUtil.QueryMethodType.Post,
            '192.168.50.18:8080',
            '/api/service-product-inwaybill/arrival-waybill/searchWaybillByWaybillCode',
            _generHttpPostQueryHeaders(),
            queryParams)
        .then((value) {
      //先将json字符串转json
      Map searchWaybillByWaybillResponJSonObj = jsonDecode(value);
      //再将json转model
      // final model = UserInfo.fromJson(json);
      var searchWaybillByWaybillRecords =
          searchWaybillByWaybillResponJSonObj['data']['records'];
      // print(searchWaybillByWaybillRecords);
      // _setLogsData(searchWaybillByWaybillRecords.toString());
      // 处理
      if (searchWaybillByWaybillRecords.length >= 1) {
        setState(() {
          rejectItemsNow = 2;
        });
        //写日志
        var nowLog =
            '</br></br></br>开始处理-------------------------------------</br></br></br></br>';
        _setLogsData(nowLog);
        for (var searchWaybillByWaybillRecord
            in searchWaybillByWaybillRecords) {
          //写日志
          // _setLogsData(searchWaybillByWaybillRecord.toString());
          // _deliveryInWaybill(searchWaybillByWaybillRecord);
          _loadData(searchWaybillByWaybillRecord);
        }
      } else {
        setState(() {
          rejectItemsNow = 2;
        });
        _setLogsData('暂无可提货出库运单！');
      }
    });
  }

  static Future<String> _deliveryInWaybill(recordObj) async {
    if (recordObj != null) {
      var queryParams = [];
      if (recordObj['smInventorySummaryList'] != null) {
        for (var smInventorySummary in recordObj['smInventorySummaryList']) {
          var send2Sub = {
            "areaId": smInventorySummary['areaId'],
            "waybillId": recordObj['id'],
            "outboundNumber": smInventorySummary['number'],
            "outStorageTime": currentTimeMillis().toString(),
            "createUser": "u80645dc73975414eaa1c90eb0f19f41a"
          };
          queryParams.add(send2Sub);
        }
      }
      // HttpUtil.init()
      //     .httpDoPostRequest(
      //   EnumUtil.QueryNetworkType.Http,
      //   EnumUtil.QueryMethodType.Post,
      //   '192.168.50.18:8080',
      //   '/api/service-product-delivery/delivery/deliveryInWaybill',
      //   _generHttpPostQueryHeaders(),
      //   queryParams,
      // )
      //     .then((value) {
      //   var nowLog = '运单' + recordObj['waybillCode'] + '提货出库:回执内容->' + value;
      //   _setLogsData(nowLog);
      // });
      return HttpUtil.init().httpDoPostRequest(
        EnumUtil.QueryNetworkType.Http,
        EnumUtil.QueryMethodType.Post,
        '192.168.50.18:8080',
        '/api/service-product-delivery/delivery/deliveryInWaybill',
        _generHttpPostQueryHeaders(),
        queryParams,
      );
    }
  }

  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  _loadData(recordObj) async {
    // 打开ReceivePort以接收传入的消息
    ReceivePort receivePort = ReceivePort();
    //创建并生成与当前Isolate共享相同代码的Isolate
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    // 流的第一个元素
    SendPort sendPort = await receivePort.first;
    // 流的第一个元素被收到后监听会关闭，所以需要新打开一个ReceivePort以接收传入的消息
    ReceivePort response = ReceivePort();
    //通过此发送端口向其对应的“ReceivePort”①发送异步[消息]，这个“消息”指的是发送的参数②。
    sendPort.send([recordObj, response.sendPort]);
    // 获取端口发送来的数据③
    var nowLog = await response.first;
    _setLogsData(nowLog);
  }

  // isolate的入口函数，该函数会在新的Isolate中调用，Isolate.spawn的message参数会作为调用它时的唯一参数
  static dataLoader(SendPort sendPort) async {
    // 打开ReceivePort①以接收传入的消息
    ReceivePort port = ReceivePort();

    // 通知其他的isolates，本isolate 所监听的端口
    sendPort.send(port.sendPort);
    // 获取其他端口发送的异步消息 msg② -> ["https://jsonplaceholder.typicode.com/posts", response.sendPort]
    await for (var msg in port) {
      //等价于List msg= await port.first;
      var recordObj = msg[0];
      SendPort replyTo = msg[1];
      _deliveryInWaybill(recordObj).then((value) {
        var nowLog = '运单' + recordObj['waybillCode'] + '提货出库:回执内容->' + value;
        // 其对应的“ReceivePort”发送解析出来的JSON数据③
        replyTo.send(nowLog);
      });
    }
  }
}
