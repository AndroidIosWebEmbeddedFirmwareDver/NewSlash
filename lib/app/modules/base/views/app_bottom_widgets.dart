import 'package:flutter/material.dart';
import 'package:newslash/app/modules/base/models/show/app_bottom_widgets_model.dart';
import 'package:newslash/utils/event_bus_util.dart';
import 'package:newslash/utils/enum_util.dart';

class AppBottomWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppBottomWidgetsState();
}

class AppBottomWidgetsState extends State<AppBottomWidgets> {
  uiWidgetBuild(BuildContext context) {
    return Container(
        color: isDarkMode(context) ? Colors.black : Colors.transparent,
        child: Row(
          children: [
            uiWidgetBuildTextButton(MIconButtonType.main, context),
            uiWidgetBuildTextButton(MIconButtonType.msg, context),
            uiWidgetBuildTextButton(MIconButtonType.user, context),
          ],
        ));
  }

  bool isDarkMode(BuildContext context) {
    // print(Theme.of(context).brightness);
    return Theme.of(context).brightness == Brightness.dark;
  }

  uiWidgetBuildTextButton(MIconButtonType? mIconButtonType, BuildContext? contex) {
    return Expanded(
      child: TextButton(
        child: Icon(
          AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.showIcons,
          color: AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed
              ? AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.onPressedColor
              : AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.normalColor,
        ),
        onPressed: () {
          setState(() {
            AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed = !AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed;
          });
          Future.delayed(Duration(milliseconds: 300)).then((value) {
            setState(() {
              AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed = !AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed;
            });
          });
          onWidgetMenuButtonPressed(mIconButtonType!, context);
        },
      ),
      flex: 1,
    );
  }

  uiWidgetBuildIconButton(MIconButtonType? mIconButtonType, BuildContext? context) {
    return Expanded(
      child: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.showIcons,
                  color: AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed
                      ? AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.onPressedColor
                      : AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.normalColor,
                ),
                onPressed: () {
                  setState(() {
                    AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed = !AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed;
                  });
                  Future.delayed(Duration(milliseconds: 300)).then((value) {
                    setState(() {
                      AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed = !AppBottomWidgetsStateModel.mShowButtons[mIconButtonType]!.isOnpressed;
                    });
                  });
                  onWidgetMenuButtonPressed(mIconButtonType!, context!);
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
  onWidgetMenuButtonPressed(MIconButtonType mIconButtonType, BuildContext context) {
    EventBusUtil.init().fire(mIconButtonType);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return uiWidgetBuild(context);
  }
}
