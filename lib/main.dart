import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newslash/utils/httpUtil.dart';
import 'package:newslash/utils/snackBarUtil.dart';
import 'package:newslash/utils/enumUtil.dart' as EnumUtil;

import 'autoreject/auto_reject_app.dart';
import 'autoreject/isolate_demo_app.dart';

// TODO ;test 2020-11-27 10:40:47

void main() {
  runApp(MaterialApp(
    // home: IsolateDemoSampleApp(),
    home: AutoRejectApp(),
  ));
}
