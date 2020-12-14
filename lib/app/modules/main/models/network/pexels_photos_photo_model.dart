import 'package:newslash/app/modules/main/models/network/pexels_photos_photo_src_model.dart';

class PexelsPhotosPhotoModel {
  late int id;
  late int width;
  late int height;
  late String url;
  late String photographer;
  late String photographer_url;
  late int photographer_id;
  late PexelsPhotosPhotoSrcModel src;
  late bool liked;

  PexelsPhotosPhotoModel(this.id, this.width, this.height, this.url, this.photographer, this.photographer_url, this.photographer_id, this.liked, this.src);
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
