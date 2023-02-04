import 'package:get/get.dart';

import '../../core/apis/home_api.dart';
import '../../core/models/news.dart';
import '../../core/models/news_category.dart';
import '../../core/models/rotation.dart';
import '../../core/models/service.dart';

class HomeController extends GetxController {
  final _isLoading = true.obs;
  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;

  final _categoryIndex = 0.obs;
  get categoryIndex => _categoryIndex.value;
  set categoryIndex(value) => _categoryIndex.value = value;

  final rotationList = <Rotation>[].obs;
  final serviceList = <ServiceItem>[].obs;
  final newsCategories = <NewsCategory>[].obs;
  final allNewsList = <News>[].obs;
  final filteredNewsList = <News>[].obs;

  // 请求主页所有数据
  void _asyncFetchAllData() async {
    rotationList.value = await HomeAPI.fetchRotationData(cacheDisk: true);
    serviceList.value = await HomeAPI.fetchAllServiceData(cacheDisk: true);
    allNewsList.value = await HomeAPI.fetchAllNewsData(cacheDisk: true);
    filteredNewsList.value = await HomeAPI.fetchAllNewsData(cacheDisk: true);
    newsCategories.value = await HomeAPI.fetchNewsCategories(cacheDisk: true);
    isLoading = false;
  }

  /// 点击分类切换新闻
  void filterNewsByCategory(int index) {
    categoryIndex = index;
    filteredNewsList.assignAll(allNewsList.where((item) {
      return int.parse(item.type!) == newsCategories[index].id;
    }).toList());
  }

  @override
  void onReady() {
    super.onReady();
    _asyncFetchAllData();
  }
}
