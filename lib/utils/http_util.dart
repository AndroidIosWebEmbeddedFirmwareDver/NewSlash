import 'dart:convert';
import 'dart:io';
import 'package:newslash/utils/enum_util.dart' as EnumUtil;
import 'package:newslash/utils/http_api.dart';

///
class HttpUtil {
  static HttpUtil mHttpUtil;
  HttpClient mHttpClient;

  //初始化
  static HttpUtil init() {
    if (mHttpUtil == null) mHttpUtil = new HttpUtil();
    if (mHttpUtil.mHttpClient == null) mHttpUtil.mHttpClient = new HttpClient();
    return mHttpUtil;
  }

// 请求网络
  Future<String> httpDoPostRequest(
      EnumUtil.QueryNetworkType mQueryNetworkType,
      EnumUtil.QueryMethodType mQueryMethodType,
      String authority,
      String unencodePath,
      [List<Map<String, String>> headers,
      Object jsonQueryParams]) async {
    var mUri;
    if (mQueryNetworkType == EnumUtil.QueryNetworkType.Http) {
      mUri = new Uri.http(authority, unencodePath);
    } else if (mQueryNetworkType == EnumUtil.QueryNetworkType.Https) {
      mUri = new Uri.https(authority, unencodePath);
    }
    // print("mUri:$mUri");
    HttpClientRequest request;
    if (mQueryMethodType == EnumUtil.QueryMethodType.Get) {
      request = await mHttpClient.getUrl(mUri);
    }
    if (mQueryMethodType == EnumUtil.QueryMethodType.Post) {
      request = await mHttpClient.postUrl(mUri);
    }
    //添加请求头
    if (headers != null) {
      headers.forEach((element) {
        element.forEach((key, value) {
          // print('key:$key,value:$value');
          request.headers.add(key, value);
        });
      });
    }
    // print("request:${request.headers}");
    /// 添加请求体
    /// https://stackoverflow.com/questions/50278258/http-post-with-json-on-body-flutter-dart/50295533
    Object jsonStr = jsonQueryParams != NullThrownError()
        ? jsonQueryParams
        : {'currentPage': '1'};
    request.add(utf8.encode(json.encode(jsonStr)));

    //开始请求
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    // print('responseBody : $responseBody');
    return responseBody;
  }

  // 请求网络
  Future<String> httpDoRequest(
      EnumUtil.QueryNetworkType mQueryNetworkType,
      EnumUtil.QueryMethodType mQueryMethodType,
      String authority,
      String unencodePath,
      [List<Map<String, String>> headers,
      Map<String, String> queryParams]) async {
    var mUri;
    if (mQueryNetworkType == EnumUtil.QueryNetworkType.Http) {
      mUri = new Uri.http(authority, unencodePath, queryParams);
    } else if (mQueryNetworkType == EnumUtil.QueryNetworkType.Https) {
      mUri = new Uri.https(authority, unencodePath, queryParams);
    }
    // print("mUri:$mUri");
    HttpClientRequest request;
    if (mQueryMethodType == EnumUtil.QueryMethodType.Get) {
      request = await mHttpClient.getUrl(mUri);
    }
    if (mQueryMethodType == EnumUtil.QueryMethodType.Post) {
      request = await mHttpClient.postUrl(mUri);
    }
    //添加请求头
    if (headers != null) {
      headers.forEach((element) {
        element.forEach((key, value) {
          // print('key:$key,value:$value');
          request.headers.add(key, value);
        });
      });
    }
    // print("request:${request.headers}");
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    // print('responseBody : $responseBody');
    return responseBody;
  }

  //Http
  Future<String> httpSearchImage(EnumUtil.SlashSource slashSource,
      [Map<String, String> queryParams]) async {
    switch (slashSource) {
      case EnumUtil.SlashSource.Pexels:
        return httpDoRequest(
            HttpApi.init(slashSource).getNetworkType(),
            HttpApi.init(slashSource).getUnencodePathOfSearchImageRequestType(),
            HttpApi.init(slashSource).getAuthority(),
            HttpApi.init(slashSource).getUnencodePathOfSearchImage(),
            HttpApi.init(slashSource).getApiKeyForHttpHeader(),
            queryParams);
      case EnumUtil.SlashSource.Pixabay:
        return null;
      case EnumUtil.SlashSource.Unslash:
        return null;
      default:
        return null;
    }
  }

  //Http
  Future<String> httpSearchaDemo([Map<String, String> queryParams]) async {
    return httpDoRequest(EnumUtil.QueryNetworkType.Http,
        EnumUtil.QueryMethodType.Get, 'baidu.com', 'a/a', null, queryParams);
  }
}
