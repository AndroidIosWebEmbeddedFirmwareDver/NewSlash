import 'package:flutter/material.dart';

class SnackBarUtil {
  /// 显示简单信息
  static void showSimpleSnackBar(
      BuildContext context, String showText, int durationMilliseconds) {
    SnackBar mSnackBar = SnackBar(
      content: Container(
        child: Text(
          showText,
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
      ),
      duration: Duration(milliseconds: durationMilliseconds),
    );
    ScaffoldMessenger.of(context).showSnackBar(mSnackBar);
  }
}
