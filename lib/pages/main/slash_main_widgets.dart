import 'package:flutter/material.dart';
import 'package:newslash/pages/main/slash_main_bottom_widgets.dart';

class SlashMainWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainWidgetsState();
}

class SlashMainWidgetsState extends State<SlashMainWidgets> {
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
              child: Text('1'),
              color: Colors.red,
            ),
            flex: 150),
        Expanded(
            child: Container(
              // child: uiBuildHeader(context),
              child: SlashMainBottomWidgets(),
              color: Colors.blue,
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
}
