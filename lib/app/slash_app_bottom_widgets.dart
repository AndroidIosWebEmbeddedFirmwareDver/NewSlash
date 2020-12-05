import 'package:flutter/material.dart';
import 'package:newslash/app/models/pexels_photos_photo_show_button.dart';
import 'package:newslash/utils/event_bus_util.dart';
import 'package:newslash/utils/enum_util.dart';

class SlashAppBottomWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashAppBottomWidgetsState();
}

class SlashAppBottomWidgetsState extends State<SlashAppBottomWidgets> {
  static Map<MIconButtonType, PexelsPhotosPhotoShowButtonModel> mShowButtons = {
    MIconButtonType.main: PexelsPhotosPhotoShowButtonModel(
      1,
      Colors.transparent,
      Icons.home,
      Colors.blue,
      Colors.white,
      false,
      'tttt',
      Colors.white,
    ),
    MIconButtonType.msg: PexelsPhotosPhotoShowButtonModel(
      1,
      Colors.transparent,
      Icons.message,
      Colors.blue,
      Colors.white,
      false,
      'tttt',
      Colors.white,
    ),
    MIconButtonType.user: PexelsPhotosPhotoShowButtonModel(
      1,
      Colors.transparent,
      Icons.verified_user,
      Colors.blue,
      Colors.white,
      false,
      'tttt',
      Colors.white,
    ),
  };
  // static var mainIconButton2 = {
  //   MIconButtonType.main: {
  //     MIconButtonStyle.showIcons: Icons.home,
  //     MIconButtonStyle.isOnpressed: false,
  //     MIconButtonStyle.onPressedColor: Colors.blue,
  //     MIconButtonStyle.normalColor: Colors.white,
  //     MIconButtonStyle.showText: 'tttt',
  //     MIconButtonStyle.showTextColor: Colors.white,
  //   },
  //   MIconButtonType.msg: {
  //     MIconButtonStyle.showIcons: Icons.message,
  //     MIconButtonStyle.isOnpressed: false,
  //     MIconButtonStyle.onPressedColor: Colors.blue,
  //     MIconButtonStyle.normalColor: Colors.white,
  //     MIconButtonStyle.showText: 'tttt',
  //     MIconButtonStyle.showTextColor: Colors.white,
  //   },
  //   MIconButtonType.user: {
  //     MIconButtonStyle.showIcons: Icons.verified_user,
  //     MIconButtonStyle.isOnpressed: false,
  //     MIconButtonStyle.onPressedColor: Colors.blue,
  //     MIconButtonStyle.normalColor: Colors.white,
  //     MIconButtonStyle.showText: 'tttt',
  //     MIconButtonStyle.showTextColor: Colors.white,
  //   }
  // };
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
      MIconButtonType? mIconButtonType, BuildContext? context) {
    return Expanded(
      child: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  mShowButtons[mIconButtonType]!.showIcons,
                  color: mShowButtons[mIconButtonType]!.isOnpressed
                      ? mShowButtons[mIconButtonType]!.onPressedColor
                      : mShowButtons[mIconButtonType]!.normalColor,
                  // mShowButtons![mIconButtonType][MIconButtonStyle.showIcons]!,
                  // color: mainIconButton[mIconButtonType]
                  //         [MIconButtonStyle.isOnpressed]
                  //     ? mainIconButton[mIconButtonType]
                  //         [MIconButtonStyle.onPressedColor]
                  //     : mainIconButton[mIconButtonType]
                  //         [MIconButtonStyle.normalColor],
                ),
                onPressed: () {
                  setState(() {
                    mShowButtons[mIconButtonType]!.isOnpressed =
                        !mShowButtons[mIconButtonType]!.isOnpressed;
                    // mainIconButton[mIconButtonType!]![
                    //     MIconButtonStyle.isOnpressed] = (mainIconButton[
                    //         mIconButtonType]![MIconButtonStyle.isOnpressed] ==
                    //     false);
                  });
                  Future.delayed(Duration(milliseconds: 300)).then((value) {
                    setState(() {
                      mShowButtons[mIconButtonType]!.isOnpressed =
                          !mShowButtons[mIconButtonType]!.isOnpressed;
                      // mainIconButton[mIconButtonType!]![
                      //     MIconButtonStyle.isOnpressed] = (mainIconButton[
                      //         mIconButtonType]![MIconButtonStyle.isOnpressed] ==
                      //     false);
                    });
                  });
                  onHeaderIconButtonPressed(mIconButtonType!, context!);
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
