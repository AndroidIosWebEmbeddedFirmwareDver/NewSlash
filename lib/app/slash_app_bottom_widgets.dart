import 'package:flutter/material.dart';
import 'package:newslash/utils/event_bus_util.dart';
import 'package:newslash/utils/enum_util.dart';

class SlashAppBottomWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashAppBottomWidgetsState();
}

class SlashAppBottomWidgetsState extends State<SlashAppBottomWidgets> {
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
    MIconButtonType.user: {
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
        uiBuildHeaderIconButton(MIconButtonType.user, context),
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

  // 点击发送Event到body容器，实现内容切换效果
  onHeaderIconButtonPressed(
      MIconButtonType mIconButtonType, BuildContext context) {
    EventBusUtil.init().fire(mIconButtonType);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return uiBuildHeader(context);
  }
}
