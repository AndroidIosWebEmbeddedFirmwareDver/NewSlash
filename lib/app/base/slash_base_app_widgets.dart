import 'package:flutter/material.dart';
import 'package:newslash/app/base/bottom/app_bottom_widgets.dart';
import 'package:newslash/app/base/slash_base_body_widgets.dart';

class SlashMainWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainWidgetsState();
}

class SlashMainWidgetsState extends State<SlashMainWidgets> {
  uiBuildBody(BuildContext context) {
    return Container();
  }

  // 构建UI，采用Column
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
              child: AppBottomWidgets(),
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
    // aEventBusDemo();
  }
}
