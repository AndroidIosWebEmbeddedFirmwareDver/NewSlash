import 'package:flutter/material.dart';
import 'package:newslash/app/slash_app_widgets.dart';

// TODO ;test 2020-11-27 10:40:47

void main() {
  runApp(MaterialApp(
    // home: IsolateDemoSampleApp(),
    home: SlashMainWidgets(),
  ));
}

//  Github上google的flutter-desktop-embedding是官方的桌面支持项目,
// https://github.com/google/flutter-desktop-embedding
initWindows() {
  // Try to resize and reposition the window to be half the width and height
  // of its screen, centered horizontally and shifted up from center.
  WidgetsFlutterBinding.ensureInitialized();
  // 获取窗口信息，然后设置窗口信息
  window_size.getWindowInfo().then((window) {
    if (window.screen != null) {
      final screenFrame = window.screen.visibleFrame;
      final width = math.max((screenFrame.width / 2).roundToDouble(), 800.0);
      final height = math.max((screenFrame.height / 2).roundToDouble(), 600.0);
      final left = ((screenFrame.width - width) / 2).roundToDouble();
      final top = ((screenFrame.height - height) / 3).roundToDouble();
      final frame = Rect.fromLTWH(left, top, width, height);
      //设置窗口信息
      window_size.setWindowFrame(frame);
      //设置窗口顶部标题
      window_size
          .setWindowTitle('Flutter Testbed on ${Platform.operatingSystem}');

      if (Platform.isMacOS) {
        window_size.setWindowMinSize(Size(800, 600));
        window_size.setWindowMaxSize(Size(1600, 1200));
      }
    }
  });
}
