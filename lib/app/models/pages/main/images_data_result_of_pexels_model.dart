import 'package:newslash/app/models/pexels_photos_show_model.dart';
import 'package:newslash/utils/app_system_params.dart';

class ImagesDataResultOfPexelsModel {
  int perPageSize = 10;
  int allPageSize = 0;
  int nowPageIndex = 0;
  bool canLoadMore = true;
  String? queryContent;
  List<PexelsPhotosShowModel>? photosShows;

  ImagesDataResultOfPexelsModel() {
    this.queryContent = AppSystemParams.cacahImageTyes;
  }
  List<PexelsPhotosShowModel>? getPhotosShows() {
    if (this.photosShows == null) this.photosShows = <PexelsPhotosShowModel>[];
    return this.photosShows;
  }

  addPhotos(List<PexelsPhotosShowModel>? photosShow) {
    photosShow!.forEach((element) {
      getPhotosShows()!.add(element);
    });
  }

  removePhotos(int removeIndex) {
    getPhotosShows()!.removeAt(removeIndex);
  }

  addPhotosForPage(int nowPageSize, List<PexelsPhotosShowModel>? photosShow) {
    photosShow!.forEach((element) {
      getPhotosShows()!.add(element);
    });
    this.canLoadMore = (nowPageSize == this.perPageSize);
  }

  toQueryJsonStr() {
    return {'page': this.nowPageIndex + 1, 'per_page': this.perPageSize, 'query': this.queryContent};
  }
}
