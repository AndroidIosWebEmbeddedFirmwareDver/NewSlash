import 'dart:convert';
import 'dart:io';
import 'package:newslash/enumUtil.dart' as EnumUtil;
import 'package:newslash/httpApi.dart';

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
  Future<String> httpDoRequest(
      EnumUtil.QueryNetworkType mQueryNetworkType,
      EnumUtil.QueryMethodType mQueryMethodType,
      String authority,
      String unencodePath,
      [List<Map<String, String>> headers,
      Map<String, String> queryParams]) async {
    var mUri;
    if (mQueryNetworkType == EnumUtil.QueryNetworkType.Http)
      mUri = new Uri.http(authority, unencodePath, queryParams);
    if (mQueryNetworkType == EnumUtil.QueryNetworkType.Https)
      mUri = new Uri.https(authority, unencodePath, queryParams);
    // print("mUri:$mUri");
    var request;
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
          print('key:$key,value:$value');
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
