import 'dart:convert';
import 'dart:io';
import 'package:newslash/utils/enum_util.dart' as EnumUtil;
import 'package:newslash/utils/http_api.dart';

class HttpUtilResponse {
  int responseStatusCode;
  String responseValueStr;
  HttpUtilResponse(this.responseStatusCode, this.responseValueStr);
}

class HttpUtil {
  late HttpClient mHttpClient;
  HttpUtil(this.mHttpClient);

  /// The static instance of the menu channel.
  static final HttpUtil instance = new HttpUtil(new HttpClient());

  static HttpUtil init() {
    return instance;
  }

  // 请求网络
  Future<HttpUtilResponse> httpDoRequest(EnumUtil.QueryNetworkType mQueryNetworkType, EnumUtil.QueryMethodType mQueryMethodType, String authority, String unencodePath,
      [List<Map<String, String>>? headers, Map<String, String>? jsonQueryParams]) async {
    var mUri;
    if (mQueryNetworkType == EnumUtil.QueryNetworkType.Http) {
      mUri = new Uri.http(authority, unencodePath, jsonQueryParams);
    } else if (mQueryNetworkType == EnumUtil.QueryNetworkType.Https) {
      mUri = new Uri.https(authority, unencodePath, jsonQueryParams);
    }
    // // print("mUri:$mUri");
    HttpClientRequest? request;
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
          request!.headers.add(key, value);
        });
      });
    }
    // print("request:${request.headers}");
    //开始请求
    var response = await request!.close();
    var responseStatusCode = response.statusCode;
    print('http-request-status:$responseStatusCode');
    String responseBody = await response.transform(Utf8Decoder()).join();
    return HttpUtilResponse(response.statusCode, responseBody);
  }

  //Http
  Future<HttpUtilResponse?> httpSearchImage(EnumUtil.SlashSource slashSource, [Map<String, String>? queryParams]) async {
    switch (slashSource) {
      case EnumUtil.SlashSource.Pexels:
        return httpDoRequest(
            HttpApi.instance.setSlashSource(slashSource).getNetworkType()!,
            HttpApi.instance.setSlashSource(slashSource).getUnencodePathOfSearchImageRequestType()!,
            HttpApi.instance.setSlashSource(slashSource).getAuthority()!,
            HttpApi.instance.setSlashSource(slashSource).getUnencodePathOfSearchImage()!,
            HttpApi.instance.setSlashSource(slashSource).getApiKeyForHttpHeader(),
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
  Future<HttpUtilResponse?> httpSearchaDemo([Map<String, String>? queryParams]) async {
    return httpDoRequest(EnumUtil.QueryNetworkType.Http, EnumUtil.QueryMethodType.Get, 'baidu.com', 'a/a', null, queryParams);
  }
}
