import 'dart:convert';
import 'dart:io';
import 'package:newslash/utils/enum_util.dart' as EnumUtil;
import 'package:newslash/utils/http_api.dart';

class HttpUtilResponse {
  int responseStatusCode;
  Future<String?> responseValueStr;
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
  Future<String?> httpDoPostRequest(EnumUtil.QueryNetworkType mQueryNetworkType, EnumUtil.QueryMethodType mQueryMethodType, String authority, String unencodePath,
      [List<Map<String, String>>? headers, Object? jsonQueryParams]) async {
    var mUri;
    if (mQueryNetworkType == EnumUtil.QueryNetworkType.Http) {
      mUri = new Uri.http(authority, unencodePath);
    } else if (mQueryNetworkType == EnumUtil.QueryNetworkType.Https) {
      mUri = new Uri.https(authority, unencodePath);
    }
    // // print("mUri:$mUri");
    // HttpClientRequest? request;
    // if (mQueryMethodType == EnumUtil.QueryMethodType.Get) {
    //   request = await mHttpClient.getUrl(mUri);
    // }
    // if (mQueryMethodType == EnumUtil.QueryMethodType.Post) {
    //   request = await mHttpClient.postUrl(mUri);
    // }
    // //添加请求头
    // if (headers != null) {
    //   headers.forEach((element) {
    //     element.forEach((key, value) {
    //       // print('key:$key,value:$value');
    //       request!.headers.add(key, value);
    //     });
    //   });
    // }
    // // print("request:${request.headers}");
    // /// 添加请求体
    // /// https://stackoverflow.com/questions/50278258/http-post-with-json-on-body-flutter-dart/50295533
    // Object jsonStr = (jsonQueryParams != NullThrownError() ? jsonQueryParams : {'currentPage': '1'})!;
    // request!.add(utf8.encode(json.encode(jsonStr)));

    // //开始请求
    // var response = await request.close();
    // var responseBody = await response.transform(Utf8Decoder()).join();

    var responseBodyObj = await doHttpPost(mUri, headers, jsonQueryParams);
    // print('responseBody : $responseBody');
    return responseBodyObj.responseValueStr;
    // return null;
  }

  Future<HttpUtilResponse> doHttpPost(Uri mUri, [List<Map<String, String>>? headers, Object? jsonQueryParams]) async {
    return mHttpClient.postUrl(mUri).then((HttpClientRequest request) {
      //添加请求头
      if (headers != null) {
        headers.forEach((element) {
          element.forEach((key, value) {
            // print('key:$key,value:$value');
            request.headers.add(key, value);
          });
        });
      }
      //添加请求参数
      Object jsonStr = (jsonQueryParams != NullThrownError() ? jsonQueryParams : {})!;
      request.add(utf8.encode(json.encode(jsonStr)));
      //开始请求
      return request.close();
    }).then((HttpClientResponse response) {
      //Process the response.
      print(response.statusCode);
      return HttpUtilResponse(response.statusCode, response.transform(Utf8Decoder()).join());
    });
  }

  Future<HttpUtilResponse> doHttpGet(Uri mUri, [List<Map<String, String>>? headers, Object? jsonQueryParams]) async {
    return mHttpClient.getUrl(mUri).then((HttpClientRequest request) {
      print('1');
      //添加请求头
      if (headers != null) {
        headers.forEach((element) {
          element.forEach((key, value) {
            // print('key:$key,value:$value');
            request.headers.add(key, value);
          });
        });
      }
      //添加请求参数
      // Object jsonStr = (jsonQueryParams != NullThrownError() ? jsonQueryParams : {'currentPage': '1'})!;
      // request.add(utf8.encode(json.encode(jsonStr)));
      //开始请求
      return request.close();
    }).then((HttpClientResponse response) {
      print('2');
      //Process the response.
      // if (response.statusCode == 200) {
      //   response.transform(utf8.decoder).join().then((String string) {
      //     print(string);
      //   });
      // } else {
      //   print("error");
      // }
      print(response.statusCode);
      return HttpUtilResponse(response.statusCode, response.transform(Utf8Decoder()).join());
    });
  }

  // 请求网络
  Future<String?> httpDoRequest(EnumUtil.QueryNetworkType mQueryNetworkType, EnumUtil.QueryMethodType mQueryMethodType, String authority, String unencodePath,
      [List<Map<String, String>>? headers, Map<String, String>? queryParams]) async {
    var mUri;
    if (mQueryNetworkType == EnumUtil.QueryNetworkType.Http) {
      mUri = new Uri.http(authority, unencodePath, queryParams);
    } else if (mQueryNetworkType == EnumUtil.QueryNetworkType.Https) {
      mUri = new Uri.https(authority, unencodePath, queryParams);
    }

    if (mQueryMethodType == EnumUtil.QueryMethodType.Get) {
      var responseBodyObj = await doHttpGet(mUri, headers, queryParams);
      return responseBodyObj.responseValueStr;
    } else if (mQueryMethodType == EnumUtil.QueryMethodType.Post) {
      var responseBodyObj = await doHttpPost(mUri, headers, queryParams);
      return responseBodyObj.responseValueStr;
    }
  }

  //Http
  Future<String?> httpSearchImage(EnumUtil.SlashSource slashSource, [Map<String, String>? queryParams]) async {
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
  Future<String?> httpSearchaDemo([Map<String, String>? queryParams]) async {
    return httpDoRequest(EnumUtil.QueryNetworkType.Http, EnumUtil.QueryMethodType.Get, 'baidu.com', 'a/a', null, queryParams);
  }
}
