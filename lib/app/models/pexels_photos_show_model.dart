import 'package:flutter/material.dart';
import 'package:newslash/app/models/pexels_photos_photo_model.dart';
import 'package:newslash/app/models/pexels_photos_photo_show_button.dart';
import 'package:newslash/utils/enum_util.dart';

class PexelsPhotosShowModel {
  late PexelsPhotosPhotoModel mPexelsPhotosPhotoModel;
  // late var rowIconButton = {
  //   MIconButtonType.favorite: {
  //     MIconButtonStyle.key: null,
  //     MIconButtonStyle.bgColor: Color(0x5500ff00),
  //     MIconButtonStyle.showIcons: Icons.hearing,
  //     MIconButtonStyle.isOnpressed: false,
  //     MIconButtonStyle.onPressedColor: Colors.blue,
  //     MIconButtonStyle.normalColor: Colors.white,
  //     MIconButtonStyle.showTextColor: Colors.white,
  //   },
  //   MIconButtonType.download: {
  //     MIconButtonStyle.key: null,
  //     MIconButtonStyle.bgColor: Color(0x55ff0000),
  //     MIconButtonStyle.showIcons: Icons.download_outlined,
  //     MIconButtonStyle.isOnpressed: false,
  //     MIconButtonStyle.onPressedColor: Colors.blue,
  //     MIconButtonStyle.normalColor: Colors.white,
  //     MIconButtonStyle.showTextColor: Colors.white,
  //   },
  // };
  Map<MIconButtonType, PexelsPhotosPhotoShowButtonModel> mButtons = {
    MIconButtonType.favorite: PexelsPhotosPhotoShowButtonModel(
      1,
      Color(0x5500ff00),
      Icons.hearing,
      Colors.blue,
      Colors.white,
      false,
      'tttt',
      Colors.white,
    ),
    MIconButtonType.download: PexelsPhotosPhotoShowButtonModel(
      1,
      Color(0x55ff0000),
      Icons.download_outlined,
      Colors.blue,
      Colors.white,
      false,
      'tttt',
      Colors.white,
    ),
  };

  init(int indexKey, PexelsPhotosPhotoModel mPexelsPhotosPhotoModel) {
    this.mPexelsPhotosPhotoModel = mPexelsPhotosPhotoModel;
    // this.rowIconButton[MIconButtonType.download]?[MIconButtonStyle.key] =indexKey;
    this.mButtons[MIconButtonType.download]!.key = indexKey;
    return this;
  }

  PexelsPhotosShowModel.fromJson(int indexKey, Map<String, dynamic> json) {
    if (json == null) return;
    this.mPexelsPhotosPhotoModel = PexelsPhotosPhotoModel.fromJson(json);
    // this.rowIconButton[MIconButtonType.download]?[MIconButtonStyle.key] =indexKey;
    this.mButtons[MIconButtonType.download]!.key = indexKey;
  }
}
