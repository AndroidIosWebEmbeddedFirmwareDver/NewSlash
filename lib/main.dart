import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newslash/httpUtil.dart';
import 'package:newslash/snackBarUtil.dart';
import 'package:newslash/enumUtil.dart' as EnumUtil;

//7.网络
void main() {
  runApp(MaterialApp(
    home: MyNetWorkBody(),
  ));
}

class MyNetWorkBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyNetWorkBodyState();
}

class MyNetWorkBodyState extends State<MyNetWorkBody> {
  var _netResponJsonData = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(_netResponJsonData),
          Expanded(
            child: Image.asset('assets/images/a.jpg'),
          ),
          Expanded(
            child: Image.asset('assets/images/b.jpg'),
          ),
          Expanded(
            child: Image.asset('assets/images/c.jpg'),
          ),
        ],
      ),
    );
  }
}
