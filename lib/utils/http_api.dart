import 'package:newslash/utils/enum_util.dart' as EnumUtil;

///
///////
///////
///
class HttpApi {
  //Unslash'api ，'https://unsplash.com'
  final Map httpUnsplashImage = const {
    'authority': 'unsplash.com',
    'apikey': '',
    'unencodePath': '',
    'httpQueryType': EnumUtil.QueryMethodType.Post,
    'networkType': EnumUtil.QueryNetworkType.Https,
  };

  //Pixabay'api，'https://pixabay.com'
  final Map httpPixabayImage = const {
    'authority': 'pixabay.com',
    'apikey': '',
    'unencodePath': '',
    'httpQueryType': EnumUtil.QueryMethodType.Post,
    'networkType': EnumUtil.QueryNetworkType.Https,
  };

  //Pexels'api，'https://api.pexels.com'
  final Map httpPexelsImage = const {
    'authority': 'api.pexels.com',
    'apikey': '563492ad6f91700001000001060f02ac515d458ea4aa2a4433ea9d2a',
    'unencodePath': '/v1/search',
    'httpQueryType': EnumUtil.QueryMethodType.Get,
    'networkType': EnumUtil.QueryNetworkType.Https,
  };

  static HttpApi mHttpApi;
  EnumUtil.SlashSource mSlashSource;

  //初始化
  static HttpApi init(EnumUtil.SlashSource slashSource) {
    if (mHttpApi == null) mHttpApi = new HttpApi();
    mHttpApi.mSlashSource = slashSource;
    return mHttpApi;
  }

  ///获取服务授权
  String getAuthority() {
    var mAuthority = 'authority';
    switch (mSlashSource) {
      case EnumUtil.SlashSource.Pexels:
        return httpPexelsImage[mAuthority];
      case EnumUtil.SlashSource.Pixabay:
        return httpPixabayImage[mAuthority];
      case EnumUtil.SlashSource.Unslash:
        return httpUnsplashImage[mAuthority];
      default:
        return null;
    }
  }

  ///获取header形式的服务key
  List<Map<String, String>> getApiKeyForHttpHeader() {
    var mApikey = 'apikey';
    switch (mSlashSource) {
      case EnumUtil.SlashSource.Pexels:
        return [
          {"Authorization": httpPexelsImage[mApikey]}
        ];
      case EnumUtil.SlashSource.Pixabay:
        return [
          {"Authorization": httpPixabayImage[mApikey]}
        ];
      case EnumUtil.SlashSource.Unslash:
        return [
          {"Authorization": httpUnsplashImage[mApikey]}
        ];
      default:
        return null;
    }
  }

  ///获取图片搜索path
  String getUnencodePathOfSearchImage() {
    var mUnencodePath = 'unencodePath';
    switch (mSlashSource) {
      case EnumUtil.SlashSource.Pexels:
        return httpPexelsImage[mUnencodePath];
      case EnumUtil.SlashSource.Pixabay:
        return httpPixabayImage[mUnencodePath];
      case EnumUtil.SlashSource.Unslash:
        return httpUnsplashImage[mUnencodePath];
      default:
        return null;
    }
  }

  ///获取图片搜索请求方式
  EnumUtil.QueryMethodType getUnencodePathOfSearchImageRequestType() {
    var mHttpQueryType = 'httpQueryType';
    switch (mSlashSource) {
      case EnumUtil.SlashSource.Pexels:
        return httpPexelsImage[mHttpQueryType];
      case EnumUtil.SlashSource.Pixabay:
        return httpPixabayImage[mHttpQueryType];
      case EnumUtil.SlashSource.Unslash:
        return httpUnsplashImage[mHttpQueryType];
      default:
        return null;
    }
  }

  ///获取图片搜索网络类型
  EnumUtil.QueryNetworkType getNetworkType() {
    var mNetworkType = 'networkType';
    switch (mSlashSource) {
      case EnumUtil.SlashSource.Pexels:
        return httpPexelsImage[mNetworkType];
      case EnumUtil.SlashSource.Pixabay:
        return httpPixabayImage[mNetworkType];
      case EnumUtil.SlashSource.Unslash:
        return httpUnsplashImage[mNetworkType];
      default:
        return null;
    }
  }
}
