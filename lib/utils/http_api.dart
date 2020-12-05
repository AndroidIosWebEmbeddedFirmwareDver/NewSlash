import 'package:newslash/utils/enum_util.dart';

class HttpApi {
  //Unslash'api ，'https://unsplash.com'
  final Map httpUnsplashImage = const {
    'authority': 'unsplash.com',
    'apikey': '',
    'unencodePath': '',
    'httpQueryType': QueryMethodType.Post,
    'networkType': QueryNetworkType.Https,
  };

  //Pixabay'api，'https://pixabay.com'
  final Map httpPixabayImage = const {
    'authority': 'pixabay.com',
    'apikey': '',
    'unencodePath': '',
    'httpQueryType': QueryMethodType.Post,
    'networkType': QueryNetworkType.Https,
  };

  //Pexels'api，'https://api.pexels.com'
  final Map httpPexelsImage = const {
    'authority': 'api.pexels.com',
    'apikey': '563492ad6f91700001000001060f02ac515d458ea4aa2a4433ea9d2a',
    'unencodePath': '/v1/search',
    'httpQueryType': QueryMethodType.Get,
    'networkType': QueryNetworkType.Https,
  };

  SlashSource mSlashSource;
  //初始化
  HttpApi(this.mSlashSource);

  /// The static instance of the menu channel.
  static final HttpApi instance = new HttpApi(SlashSource.Pexels);

  HttpApi setSlashSource(SlashSource mSlashSource) {
    instance.mSlashSource = mSlashSource;
    return instance;
  }

  ///获取服务授权
  String? getAuthority() {
    var mAuthority = 'authority';
    switch (mSlashSource) {
      case SlashSource.Pexels:
        return httpPexelsImage[mAuthority];
      case SlashSource.Pixabay:
        return httpPixabayImage[mAuthority];
      case SlashSource.Unslash:
        return httpUnsplashImage[mAuthority];
      default:
        return null;
    }
  }

  ///获取header形式的服务key
  List<Map<String, String>>? getApiKeyForHttpHeader() {
    var mApikey = 'apikey';
    switch (mSlashSource) {
      case SlashSource.Pexels:
        return [
          {"Authorization": httpPexelsImage[mApikey]}
        ];
      case SlashSource.Pixabay:
        return [
          {"Authorization": httpPixabayImage[mApikey]}
        ];
      case SlashSource.Unslash:
        return [
          {"Authorization": httpUnsplashImage[mApikey]}
        ];
      default:
        return null;
    }
  }

  ///获取图片搜索path
  String? getUnencodePathOfSearchImage() {
    var mUnencodePath = 'unencodePath';
    switch (mSlashSource) {
      case SlashSource.Pexels:
        return httpPexelsImage[mUnencodePath];
      case SlashSource.Pixabay:
        return httpPixabayImage[mUnencodePath];
      case SlashSource.Unslash:
        return httpUnsplashImage[mUnencodePath];
      default:
        return null;
    }
  }

  ///获取图片搜索请求方式
  QueryMethodType? getUnencodePathOfSearchImageRequestType() {
    var mHttpQueryType = 'httpQueryType';
    switch (mSlashSource) {
      case SlashSource.Pexels:
        return httpPexelsImage[mHttpQueryType];
      case SlashSource.Pixabay:
        return httpPixabayImage[mHttpQueryType];
      case SlashSource.Unslash:
        return httpUnsplashImage[mHttpQueryType];
      default:
        return null;
    }
  }

  ///获取图片搜索网络类型
  QueryNetworkType? getNetworkType() {
    var mNetworkType = 'networkType';
    switch (mSlashSource) {
      case SlashSource.Pexels:
        return httpPexelsImage[mNetworkType];
      case SlashSource.Pixabay:
        return httpPixabayImage[mNetworkType];
      case SlashSource.Unslash:
        return httpUnsplashImage[mNetworkType];
      default:
        return null;
    }
  }
}
