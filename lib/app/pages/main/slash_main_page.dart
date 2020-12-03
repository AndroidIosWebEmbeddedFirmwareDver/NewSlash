import 'package:flutter/material.dart';
import 'package:newslash/utils/enum_util.dart';
import 'package:newslash/utils/event_bus_util.dart';

class SlashMainPageWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainPageWidgetsState();
}

class SlashMainPageWidgetsState extends State<SlashMainPageWidgets> {
  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
              child: Text('MAIN'),
              color: Colors.white,
            ),
            flex: 150),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return uiBuild(context);
  }
}
