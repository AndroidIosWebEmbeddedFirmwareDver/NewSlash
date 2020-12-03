class PexelsPhotosPhotoSrcModel {
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  PexelsPhotosPhotoSrcModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    this.original = json['original'];
    this.large2x = json['large2x'];
    this.large = json['large'];
    this.medium = json['medium'];
    this.small = json['small'];
    this.portrait = json['portrait'];
    this.landscape = json['landscape'];
    this.tiny = json['tiny'];
  }
}
