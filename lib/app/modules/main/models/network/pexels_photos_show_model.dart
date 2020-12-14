import 'package:flutter/material.dart';
import 'package:newslash/app/modules/main/models/network/pexels_photos_photo_model.dart';
import 'package:newslash/app/modules/main/models/network/pexels_photos_photo_show_button.dart';
import 'package:newslash/utils/enum_util.dart';

class PexelsPhotosShowModel {
  late PexelsPhotosPhotoModel mPexelsPhotosPhotoModel;
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
    this.mButtons[MIconButtonType.download]!.key = indexKey;
    return this;
  }

  PexelsPhotosShowModel.fromJson(int indexKey, Map<String, dynamic> json) {
    if (json == null) return;
    this.mPexelsPhotosPhotoModel = PexelsPhotosPhotoModel.fromJson(json);
    this.mButtons[MIconButtonType.download]!.key = indexKey;
  }
}
