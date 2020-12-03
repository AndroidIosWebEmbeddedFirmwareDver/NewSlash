import 'package:flutter/material.dart';
import 'package:newslash/app/models/pexels_photos_photo_model.dart';
import 'package:newslash/utils/enum_util.dart';

class PexelsPhotosShowModel {
  PexelsPhotosPhotoModel mPexelsPhotosPhotoModel;
  var rowIconButton = {
    MIconButtonType.download: {
      MIconButtonStyle.key: null,
      MIconButtonStyle.showIcons: Icons.download_outlined,
      MIconButtonStyle.isOnpressed: false,
      MIconButtonStyle.onPressedColor: Colors.blue,
      MIconButtonStyle.normalColor: Colors.white,
      MIconButtonStyle.showTextColor: Colors.white,
    },
  };

  init(int indexKey, PexelsPhotosPhotoModel mPexelsPhotosPhotoModel) {
    this.mPexelsPhotosPhotoModel = mPexelsPhotosPhotoModel;
    this.rowIconButton[MIconButtonType.download][MIconButtonStyle.key] =
        indexKey;
    return this;
  }

  PexelsPhotosShowModel.fromJson(int indexKey, Map<String, dynamic> json) {
    if (json == null) return;
    this.mPexelsPhotosPhotoModel = PexelsPhotosPhotoModel.fromJson(json);
    this.rowIconButton[MIconButtonType.download][MIconButtonStyle.key] =
        indexKey;
  }
}
