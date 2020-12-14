import 'package:flutter/material.dart';

class SlashUserPresenter {
  static void showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationIcon: Image.asset(
        'assets/images/pic1.jpg',
        height: 100,
        width: 100,
      ),
      applicationName: '应用程序',
      applicationVersion: '1.0.0',
      applicationLegalese: 'copyright ',
      // children: <Widget>[
      //   Container(
      //     height: 30,
      //     color: Colors.red,
      //   ),
      //   Container(
      //     height: 30,
      //     color: Colors.blue,
      //   ),
      //   Container(
      //     height: 30,
      //     color: Colors.green,
      //   )
      // ],
    );
  }
}
