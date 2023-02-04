import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/constants/path_constants.dart';

import '../services/user_store.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;
  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: PathConstants.BASE_URL,
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }

  /// 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    if (Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
      headers['Authorization'] = UserStore.to.token;
    }
    return headers;
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    return response.data;
  }
}
