import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserAmapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildUi();
  }

  buildUi() {
    // Enable hybrid composition.
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    return WebView(
      initialUrl: 'https://flutter.dev',
    );
  }
}
