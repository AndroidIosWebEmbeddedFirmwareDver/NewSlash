import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:newslash/modules/base/views/slash_base_app_widgets.dart';
import 'package:newslash/plugins/window_size/lib/window_size.dart' as window_size;

void main() {
  runApp(MaterialApp(
    // home: IsolateDemoSampleApp(),
    // home: AutoRejectApp(),
    home: SlashMainWidgets(),
    // 国际化
    // localizationsDelegates: [
    //   GlobalMaterialLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate,
    // ],
    // supportedLocales: [
    //   const Locale('zh', 'CH'),
    //   const Locale('en', 'US'),
    // ],
    // locale: Locale('zh'),
  ));
  // initWindows();
}

//  Github上google的flutter-desktop-embedding是官方的桌面支持项目,
// https://github.com/google/flutter-desktop-embedding
initWindows() {
  // Try to resize and reposition the window to be half the width and height
  // of its screen, centered horizontally and shifted up from center.
  WidgetsFlutterBinding.ensureInitialized();
  // 获取窗口信息，然后设置窗口信息
  window_size.getWindowInfo().then((window) {
    print('Flutter application run on ${Platform.operatingSystem}');
    if (window.screen != null) {
      final screenFrame = window.screen!.visibleFrame;
      final width = math.max((screenFrame.width / 2).roundToDouble(), 800.0);
      final height = math.max((screenFrame.height / 2).roundToDouble(), 600.0);
      final left = ((screenFrame.width - width) / 2).roundToDouble();
      final top = ((screenFrame.height - height) / 3).roundToDouble();
      final frame = Rect.fromLTWH(left, top, width, height);
      //设置窗口信息
      window_size.setWindowFrame(frame);
      //设置窗口顶部标题
      window_size.setWindowTitle('Flutter Testbed on ${Platform.operatingSystem}');
      if (Platform.isMacOS) {
        window_size.setWindowMinSize(Size(800, 600));
        window_size.setWindowMaxSize(Size(1600, 1200));
      } else if (Platform.isMacOS) {
        window_size.setWindowMinSize(Size(800, 600));
        window_size.setWindowMaxSize(Size(1600, 1200));
      }
    }
  });
}
