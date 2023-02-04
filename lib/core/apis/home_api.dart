import 'package:smart_city_getx/core/models/news_category.dart';

import '../models/news.dart';
import '../models/rotation.dart';
import '../models/service.dart';
import '../utils/http.dart';

class HomeAPI {
  /// 请求轮播数据
  static Future<List<Rotation>> fetchRotationData({
    bool cacheDisk = false,
  }) async {
    final response = await HttpUtil().get(
      '/api/rotation/list',
      cacheDisk: cacheDisk,
    );
    final rows = response['rows'];
    return (rows as List).map((e) => Rotation.fromJson(e)).toList();
  }

  /// 请求服务数据
  static Future<List<ServiceItem>> fetchAllServiceData({
    bool cacheDisk = false,
  }) async {
    final response = await HttpUtil().get(
      '/api/service/list',
      cacheDisk: cacheDisk,
    );
    final rows = response['rows'];
    return (rows as List).map((e) => ServiceItem.fromJson(e)).toList();
  }

  /// 请求新闻数据
  static Future<List<News>> fetchAllNewsData({
    bool cacheDisk = false,
  }) async {
    final response = await HttpUtil().get(
      '/press/press/list',
      cacheDisk: cacheDisk,
    );
    final rows = response['rows'];
    return (rows as List).map((e) => News.fromJson(e)).toList();
  }

  /// 请求新闻分类
  static Future<List<NewsCategory>> fetchNewsCategories({
    bool cacheDisk = false,
  }) async {
    final response = await HttpUtil().get(
      '/press/category/list',
      cacheDisk: cacheDisk,
    );
    final data = response['data'];
    return (data as List).map((e) => NewsCategory.fromJson(e)).toList();
  }
}
