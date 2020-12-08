import 'package:flutter/material.dart';
import 'package:newslash/plugins/lazy_load_list_view/lazy_load_list_view_widget.dart';
import 'package:newslash/utils/enum_util.dart';
import 'package:newslash/utils/event_bus_util.dart';
import 'package:newslash/utils/toast_msg_util.dart';

class SlashMsgPageWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMsgPageWidgetsState();
}

class SlashMsgPageWidgetsState extends State<SlashMsgPageWidgets> {
  late List<String> _itemCounts;

  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
              child: LazyLoadListViewWidget.builder(
                itemCount: _itemCounts.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRowFrameLayout(position, context);
                },
                onLoadMore: () {
                  ToastMsgUtil.showNromMsg(context, 'onLoadMore');
                  addDatas();
                },
                onRefresh: () {
                  ToastMsgUtil.showNromMsg(context, 'onRefresh');
                  initDatas();
                },
              ),
            ),
            flex: 150),
      ],
    );
  }

  Widget getRowFrameLayout(int dataIndex, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        color: Color(0x889f0000),
        height: 300,
        child: Center(
          child: GestureDetector(
            child: Text(
              '$dataIndex',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
              ),
            ),
            onTap: () {
              ToastMsgUtil.showNromMsg(context, 'Touch , $dataIndex');
            },
          ),
        ),
      ),
    );
  }

  initDatas() {
    //初始化数据
    _itemCounts = <String>[];
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
  }

  addDatas() {
    //初始化数据
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return uiBuild(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatas();
  }
}
