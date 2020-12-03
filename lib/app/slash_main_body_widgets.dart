import 'package:flutter/material.dart';
import 'package:newslash/app/pages/main/slash_main_page.dart';
import 'package:newslash/app/pages/msg/slash_msg_page.dart';
import 'package:newslash/app/pages/user/slash_user_page.dart';
import 'package:newslash/utils/enum_util.dart';
import 'package:newslash/utils/event_bus_util.dart';

class SlashMainBodyWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainBodyWidgetsState();
}

class SlashMainBodyWidgetsState extends State<SlashMainBodyWidgets> {
  //默认显示主页
  MIconButtonType nowShowBody = MIconButtonType.main;
  // 构建路由页面 .https://flutter.cn/docs/development/ui/navigation
  buildBodRouterWidget() {
    switch (nowShowBody) {
      case MIconButtonType.main:
        return SlashMainPageWidgets();
        break;
      case MIconButtonType.msg:
        return SlashMsgPageWidgets();
        break;
      case MIconButtonType.user:
        return SlashUserPageWidgets();
        break;
      default:
        return Container(
          child: Text('Nothing...'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildBodRouterWidget();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EventBusUtil.init().on().listen((event) {
      setState(() {
        nowShowBody = event;
      });
    });
  }
}
