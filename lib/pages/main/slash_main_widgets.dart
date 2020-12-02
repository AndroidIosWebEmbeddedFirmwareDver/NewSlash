import 'package:flutter/material.dart';

class SlashMainWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainWidgetsState();
}
// enum IconButtonStyle{onPressed:'onPressed'}

class SlashMainWidgetsState extends State<SlashMainWidgets> {
  var mainIconButton = {
    'onPressed': false,
    'colorNromal': Colors.white,
    'colorOnpressed': Colors.blue
  };

  //
  uiBuildHeader() {
    return Container(
        child: Row(
      children: [
        Expanded(
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            color: Colors.orange,
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: Center(
              child: Text('B'),
            ),
            color: Colors.blue,
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: Center(
              child: Text('C'),
            ),
            color: Colors.green,
          ),
          flex: 1,
        ),
      ],
    ));
  }

  //
  uiBuildBody() {
    return Container();
  }

  // 构建UI，采用Row
  uiBuild() {
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
              child: uiBuildHeader(),
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
      body: uiBuild(),
    );
  }
}
