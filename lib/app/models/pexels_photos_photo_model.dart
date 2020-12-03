import 'package:newslash/app/models/pexels_photos_photo_src_model.dart';

class PexelsPhotosPhotoModel {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographer_url;
  int photographer_id;
  PexelsPhotosPhotoSrcModel src;
  bool liked;

  PexelsPhotosPhotoModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    this.id = json['id'];
    this.width = json['width'];
    this.height = json['height'];
    this.url = json['url'];
    this.photographer = json['photographer'];
    this.photographer_url = json['photographer_url'];
    this.photographer_id = json['photographer_id'];

    var srcJson = json['src'];
    if (srcJson != null) {
      this.src = PexelsPhotosPhotoSrcModel.fromJson(srcJson);
    }

    this.liked = json['liked'];
  }
}
