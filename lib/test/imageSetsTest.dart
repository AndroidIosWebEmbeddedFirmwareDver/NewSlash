import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newslash/utils/http_util.dart';
import 'package:newslash/utils/snack_bar_util.dart';
import 'package:newslash/utils/enum_util.dart' as EnumUtil;

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
  var imageSet = {
    'pre': {
      'image1': 'assets/images/b.jpg',
      'image2': 'assets/images/c.jpg',
      'image3': 'assets/images/a.jpg',
    },
    'normal': {
      'image1': 'assets/images/a.jpg',
      'image2': 'assets/images/b.jpg',
      'image3': 'assets/images/c.jpg',
    },
    'next': {
      'image1': 'assets/images/c.jpg',
      'image2': 'assets/images/a.jpg',
      'image3': 'assets/images/b.jpg',
    },
  };
  var _nowShowWaht = 'normal';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 300,
        height: 400,
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () {
                  onNavigationPressed(context, 'before');
                },
                child: Icon(Icons.navigate_before),
              ),
              Expanded(
                child: Image.asset(imageSet[_nowShowWaht]['image1']),
              ),
              Expanded(
                flex: 3,
                child: Image.asset(imageSet[_nowShowWaht]['image2']),
              ),
              Expanded(
                flex: 1,
                child: Image.asset(imageSet[_nowShowWaht]['image3']),
              ),
              MaterialButton(
                onPressed: () {
                  onNavigationPressed(context, 'next');
                },
                child: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ));
  }

  onNavigationPressed(BuildContext context, String type) {
    SnackBarUtil.showSimpleSnackBar(context, _nowShowWaht, 1500);
    setState(() {
      if (type == 'before' && _nowShowWaht == 'normal') {
        _nowShowWaht = 'pre';
      } else if (type == 'before' && _nowShowWaht == 'pre') {
        _nowShowWaht = 'next';
      } else if (type == 'before' && _nowShowWaht == 'next') {
        _nowShowWaht = 'normal';
      } else if (type == 'next' && _nowShowWaht == 'normal') {
        _nowShowWaht = 'next';
      } else if (type == 'next' && _nowShowWaht == 'pre') {
        _nowShowWaht = 'normal';
      } else if (type == 'next' && _nowShowWaht == 'next') {
        _nowShowWaht = 'normal';
      }
    });
  }
}
