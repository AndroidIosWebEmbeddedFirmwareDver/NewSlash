import 'package:flutter/material.dart';
import 'package:newslash/app/modules/main/models/network/pexels_photos_photo_show_button.dart';
import 'package:newslash/utils/enum_util.dart';

class AppBottomWidgetsStateModel {
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
}
