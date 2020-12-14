import 'package:flutter/material.dart';
import 'package:newslash/app/modules/main/views/slash_main_page.dart';
import 'package:newslash/app/modules/msg/views/slash_msg_page.dart';
import 'package:newslash/app/modules/user/views/slash_user_page.dart';
import 'package:newslash/utils/enum_util.dart';
import 'package:newslash/utils/event_bus_util.dart';

class SlashMainBodyWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainBodyWidgetsState();
}

class SlashMainBodyWidgetsState extends State<SlashMainBodyWidgets> {
  late int _mainBodyShowIndex;

  //regist event
  registEnentBusEnent<T>() {
    EventBusUtil.init().on<T>()?.listen((event) {
      print('aEvent:$event');
      buildBodRouterWidget(event);
    });
  }

  // 构建路由页面 .https://flutter.cn/docs/development/ui/navigation
  // https://github.com/Timdk857/Android-Architecture-knowledge-2-/blob/master/Flutter/%E9%AB%98%E9%A2%91Flutter-%E9%97%AE%E9%A2%98%E5%A4%A7%E6%B1%87%E6%80%BB%EF%BC%8C%E6%80%BB%E6%9C%89%E4%B8%80%E6%AC%BE%E6%9B%BE%E5%9B%B0%E6%83%91%E4%BD%A0%EF%BC%81%EF%BC%88%E5%90%AB%E8%A7%A3%E5%86%B3%E9%97%AE%E9%A2%98%E6%96%B9%E6%B3%95%EF%BC%89.md
  buildBodRouterWidget(event) {
    if (event is MIconButtonType) {
      setState(() {
        switch (event) {
          case MIconButtonType.main:
            _mainBodyShowIndex = 0;
            break;
          case MIconButtonType.msg:
            _mainBodyShowIndex = 1;
            break;
          case MIconButtonType.user:
            _mainBodyShowIndex = 2;
            break;
          default:
            _mainBodyShowIndex = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IndexedStack(
      index: _mainBodyShowIndex,
      children: [SlashMainPageWidgets(), SlashMsgPageWidgets(), SlashUserPageWidgets()],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化显示内容参数
    _mainBodyShowIndex = 0;
    // 初始化EventBus组件
    registEnentBusEnent<MIconButtonType>();
  }
}
