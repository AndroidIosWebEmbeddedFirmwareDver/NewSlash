import 'package:newslash/app/models/pexels_photos_photo_model.dart';
import 'package:newslash/app/models/pexels_photos_show_model.dart';

class PexelsPhotosModel {
  int page;
  int per_page;
  // List<PexelsPhotosPhotoModel> photos;
  List<PexelsPhotosShowModel> photosShow;
  int total_results;
  String next_page;

  PexelsPhotosModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    this.page = json['page'];
    this.per_page = json['per_page'];
    //遍历取出photos。
    var photosJson = json['photos'];
    // if (photosJson != null) {
    //   this.photos = new List<PexelsPhotosPhotoModel>();
    //   photosJson.forEach((element) =>
    //       this.photos.add(PexelsPhotosPhotoModel.fromJson(element)));
    // }
    if (photosJson != null) {
      this.photosShow = new List<PexelsPhotosShowModel>();
      int indexKey = 0;
      photosJson.forEach((element) {
        this.photosShow.add(PexelsPhotosShowModel.fromJson(indexKey, element));
        indexKey++;
      });
    }
    this.next_page = json['next_page'];
  }
}
