import 'dart:convert';
import 'dart:io';
import 'package:newslash/utils/enum_util.dart' as EnumUtil;
import 'package:newslash/utils/http_api.dart';

class HttpUtilResponse {
  static final int httpResponseTrueCode = 200;
  static final int httpResponseFailCode = 500;
  static final int httpResponseNotFoundCode = 404;

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
  Future<HttpUtilResponse> httpDoGetRequest(EnumUtil.QueryNetworkType mQueryNetworkType, EnumUtil.QueryMethodType mQueryMethodType, String authority, String unencodePath,
      [List<Map<String, String>>? headers, Map<String, String>? jsonQueryParams]) async {
    return mHttpClient
        .getUrl(mQueryNetworkType == EnumUtil.QueryNetworkType.Http
            ? Uri.http(authority, unencodePath, jsonQueryParams)
            : Uri.https(authority, unencodePath, jsonQueryParams))
        .then((HttpClientRequest mRequest) {
      //添加请求头
      if (headers != null) {
        headers.forEach((element) {
          element.forEach((key, value) {
            // print('key:$key,value:$value');
            mRequest.headers.add(key, value);
          });
        });
      }
      return mRequest.close();
    }).then((HttpClientResponse mResponse) async {
      var responseStatusCode = mResponse.statusCode;
      // print('http-request-status:$responseStatusCode');
      String responseBody = await mResponse.transform(Utf8Decoder()).join();
      return HttpUtilResponse(responseStatusCode, responseBody);
    });
  }

  // 请求网络
  Future<HttpUtilResponse> httpDoPostRequest(
      EnumUtil.QueryNetworkType mQueryNetworkType, EnumUtil.QueryMethodType mQueryMethodType, String authority, String unencodePath,
      [List<Map<String, String>>? headers, Object? jsonQueryParams]) async {
    return mHttpClient
        .postUrl(mQueryNetworkType == EnumUtil.QueryNetworkType.Http ? Uri.http(authority, unencodePath) : Uri.https(authority, unencodePath))
        .then((HttpClientRequest mRequest) {
      //添加请求头
      if (headers != null) {
        headers.forEach((element) {
          element.forEach((key, value) {
            // print('key:$key,value:$value');
            mRequest.headers.add(key, value);
          });
        });
      }
      //添加请求Body
      mRequest.add(utf8.encode(json.encode(jsonQueryParams)));
      return mRequest.close();
    }).then((HttpClientResponse mResponse) async {
      var responseStatusCode = mResponse.statusCode;
      // print('http-request-status:$responseStatusCode');
      String responseBody = await mResponse.transform(Utf8Decoder()).join();
      return HttpUtilResponse(responseStatusCode, responseBody);
    });
  }

  //Http
  Future<HttpUtilResponse?> httpSearchImage(EnumUtil.SlashSource slashSource, [Map<String, String>? queryParams]) async {
    switch (slashSource) {
      case EnumUtil.SlashSource.Pexels:
        return httpDoGetRequest(
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
    return httpDoGetRequest(EnumUtil.QueryNetworkType.Http, EnumUtil.QueryMethodType.Get, 'baidu.com', 'a/a', null, queryParams);
  }
}
