import 'package:flutter/material.dart';

class PexelsPhotosPhotoShowButtonModel {
  late int key;
  late Color bgColor;
  late IconData showIcons;
  late Color onPressedColor;
  late Color normalColor;
  late bool isOnpressed;
  late String showText;
  late Color showTextColor;

  PexelsPhotosPhotoShowButtonModel(this.key, this.bgColor, this.showIcons, this.onPressedColor, this.normalColor,
      this.isOnpressed, this.showText, this.showTextColor);
}
