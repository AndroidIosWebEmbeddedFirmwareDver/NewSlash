import 'package:flutter/material.dart';
import 'package:newslash/app/slash_app_bottom_widgets.dart';
import 'package:newslash/app/slash_main_body_widgets.dart';
import 'package:newslash/utils/event_bus_util.dart';

class SlashMainWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainWidgetsState();
}

class SlashMainWidgetsState extends State<SlashMainWidgets> {
  aEventBusDemo() {
    EventBusUtil.init().on()?.listen((event) {
      print('aEventBusDemo:$event');
    });
  }

  //
  uiBuildBody(BuildContext context) {
    return Container();
  }

  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
              child: SlashMainBodyWidgets(),
            ),
            flex: 163),
        Expanded(
            child: Container(
              child: SlashAppBottomWidgets(),
            ),
            flex: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: uiBuild(context),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aEventBusDemo();
  }
}
