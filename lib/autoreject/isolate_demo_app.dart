import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(SampleApp());
// }

class IsolateDemoSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SampleAppPage(
        key: new Key('value'),
      ),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({required Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    // 打开ReceivePort以接收传入的消息
    ReceivePort receivePort = ReceivePort();
    //创建并生成与当前Isolate共享相同代码的Isolate
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // 流的第一个元素
    SendPort sendPort = await receivePort.first;
    // 流的第一个元素被收到后监听会关闭，所以需要新打开一个ReceivePort以接收传入的消息
    ReceivePort response = ReceivePort();
    //通过此发送端口向其对应的“ReceivePort”①发送异步[消息]，这个“消息”指的是发送的参数②。
    sendPort.send(
        ["https://jsonplaceholder.typicode.com/posts", response.sendPort]);
    // 获取端口发送来的数据③
    List msg = await response.first;

    setState(() {
      widgets = msg;
    });
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
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // 其对应的“ReceivePort”发送解析出来的JSON数据③
      replyTo.send(json.decode(response.body));
    }
  }
}
