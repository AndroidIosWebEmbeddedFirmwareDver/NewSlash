import 'package:newslash/app/models/pexels_photos_show_model.dart';

class PexelsPhotosModel {
  late int page;
  late int per_page;
  // List<PexelsPhotosPhotoModel> photos;
  late List<PexelsPhotosShowModel> photosShow;
  late int total_results;
  late String next_page;

  PexelsPhotosModel(this.page, this.per_page, this.photosShow, this.total_results, this.next_page);

  PexelsPhotosModel.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json == null) return;
    this.page = json['page'];
    this.per_page = json['per_page'];
    //遍历取出photos。
    var photosJson = json['photos'];
    if (photosJson != null) {
      this.photosShow = <PexelsPhotosShowModel>[];
      int indexKey = 0;
      photosJson.forEach((element) {
        this.photosShow.add(PexelsPhotosShowModel?.fromJson(indexKey, element));
        indexKey++;
      });
    }
    this.next_page = json['next_page'];
  }
}
