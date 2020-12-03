import 'package:flutter/material.dart';

enum MIconButtonType { main, msg, users }
enum MIconButtonStyle {
  showIcons,
  onPressedColor,
  normalColor,
  isOnpressed,
  showText,
  showTextColor
}

class SlashMainBottomWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainBottomWidgetsState();
}

class SlashMainBottomWidgetsState extends State<SlashMainBottomWidgets> {
  var mainIconButton = {
    MIconButtonType.main: {
      MIconButtonStyle.showIcons: Icons.home,
      MIconButtonStyle.isOnpressed: false,
      MIconButtonStyle.onPressedColor: Colors.blue,
      MIconButtonStyle.normalColor: Colors.white,
      MIconButtonStyle.showText: 'tttt',
      MIconButtonStyle.showTextColor: Colors.white,
    },
    MIconButtonType.msg: {
      MIconButtonStyle.showIcons: Icons.message,
      MIconButtonStyle.isOnpressed: false,
      MIconButtonStyle.onPressedColor: Colors.blue,
      MIconButtonStyle.normalColor: Colors.white,
      MIconButtonStyle.showText: 'tttt',
      MIconButtonStyle.showTextColor: Colors.white,
    },
    MIconButtonType.users: {
      MIconButtonStyle.showIcons: Icons.verified_user,
      MIconButtonStyle.isOnpressed: false,
      MIconButtonStyle.onPressedColor: Colors.blue,
      MIconButtonStyle.normalColor: Colors.white,
      MIconButtonStyle.showText: 'tttt',
      MIconButtonStyle.showTextColor: Colors.white,
    }
  };
  //
  uiBuildHeader(BuildContext context) {
    return Container(
        child: Row(
      children: [
        uiBuildHeaderIconButton(MIconButtonType.main, context),
        uiBuildHeaderIconButton(MIconButtonType.msg, context),
        uiBuildHeaderIconButton(MIconButtonType.users, context),
      ],
    ));
  }

  uiBuildHeaderIconButton(
      MIconButtonType mIconButtonType, BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  mainIconButton[mIconButtonType][MIconButtonStyle.showIcons],
                  color: mainIconButton[mIconButtonType]
                          [MIconButtonStyle.isOnpressed]
                      ? mainIconButton[mIconButtonType]
                          [MIconButtonStyle.onPressedColor]
                      : mainIconButton[mIconButtonType]
                          [MIconButtonStyle.normalColor],
                ),
                onPressed: () {
                  setState(() {
                    mainIconButton[mIconButtonType]
                            [MIconButtonStyle.isOnpressed] =
                        !mainIconButton[mIconButtonType]
                            [MIconButtonStyle.isOnpressed];
                  });
                  Future.delayed(Duration(milliseconds: 300)).then((value) {
                    setState(() {
                      mainIconButton[mIconButtonType]
                              [MIconButtonStyle.isOnpressed] =
                          !mainIconButton[mIconButtonType]
                              [MIconButtonStyle.isOnpressed];
                    });
                  });
                  onHeaderIconButtonPressed(mIconButtonType, context);
                },
              ),
            ],
          ),
        ),
        color: Colors.orange,
      ),
      flex: 1,
    );
  }

  onHeaderIconButtonPressed(
      MIconButtonType mIconButtonType, BuildContext context) {
    switch (mIconButtonType) {
      case MIconButtonType.main:
        // SnackBarUtil.showSimpleSnackBar(context, 'showText', 1000);
        break;
      case MIconButtonType.msg:
        break;
      case MIconButtonType.users:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return uiBuildHeader(context);
  }
}
