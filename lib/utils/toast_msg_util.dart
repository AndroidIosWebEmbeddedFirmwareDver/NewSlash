import 'package:flutter/material.dart';
import 'package:newslash/utils/toast_msg_pc.dart';
import 'package:newslash/utils/toast_msg_mobile.dart';

class ToastMsgUtil {
  static showNromMsg1(String? msg) {
    Fluttertoast.showToast(
        msg: msg!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showNromMsg(BuildContext? context, String? msg) {
    LazyToast().builder(context!, msg!);
  }

  static showNromaMsgAsDialog(BuildContext? context, String? msg) {
    showDialog(
        context: context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            child: GestureDetector(
              child: Center(
                child: Text(msg!),
              ),
              onTap: () {
                Navigator.of(context)!.pop();
              },
            ),
          );
        });
  }
}
