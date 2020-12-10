import 'package:newslash/app/models/pexels_photos_model.dart';
import 'package:newslash/app/models/pexels_photos_show_model.dart';
import 'package:newslash/utils/app_system_params.dart';

class ImagesDataResultOfPexelsModel {
  int perPageSize = 5;
  int allPageSize = 0;
  int nowPageIndex = 0;
  int queryPageIndex = 0;
  bool canRefresh = true;
  bool canLoadMore = true;
  bool inLoading = false;
  late String queryContent;
  List<PexelsPhotosShowModel>? photosShow;

  ImagesDataResultOfPexelsModel() {
    this.queryContent = AppSystemParams.cacahImageTyes;
  }
  List<PexelsPhotosShowModel>? getPhotosShows() {
    if (this.photosShow == null) this.photosShow = <PexelsPhotosShowModel>[];
    return this.photosShow;
  }

  bool canDoRefresh() {
    return (!this.inLoading) && this.canRefresh;
  }

  bool canDoLoadMore() {
    return (!this.inLoading) && this.canLoadMore;
  }

  ImagesDataResultOfPexelsModel initLoadMore() {
    this.queryPageIndex = this.nowPageIndex + 1;
    return this;
  }

  ImagesDataResultOfPexelsModel initRefresh() {
    this.queryPageIndex = 1;
    this.nowPageIndex = 1;
    return this;
  }

  removePhotos(int removeIndex) {
    getPhotosShows()!.removeAt(removeIndex);
  }

  addPhotosForPage(List<PexelsPhotosShowModel>? photosShow) {
    if (photosShow!.length > 0) {
      photosShow.forEach((element) {
        getPhotosShows()!.add(element);
      });
      this.canLoadMore = (photosShow.length == this.perPageSize);
      this.nowPageIndex += 1;
    }
    this.inLoading = false;
  }

  Map<String, String> toQueryJsonStr() {
    return {'page': this.queryPageIndex.toString(), 'per_page': this.perPageSize.toString(), 'query': this.queryContent};
  }

  ImagesDataResultOfPexelsModel.fromJson(Map<String, dynamic> json) {
    addPhotosForPage(PexelsPhotosModel.fromJson(json).photosShow);
  }
}
