class PexelsPhotosPhotoSrcModel {
  late String original;
  late String large2x;
  late String large;
  late String medium;
  late String small;
  late String portrait;
  late String landscape;
  late String tiny;
  PexelsPhotosPhotoSrcModel(this.original, this.large2x, this.large,
      this.medium, this.small, this.portrait, this.landscape, this.tiny);

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
