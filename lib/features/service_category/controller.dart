import 'package:get/get.dart';
import 'package:smart_city_getx/core/models/service.dart';

import '../home/controller.dart';

class ServiceController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final homeController = Get.find<HomeController>();

  var categories = {}.obs;

  void mapItemToCategory() {
    var list = List<ServiceItem>.from(homeController.serviceList);
    for (var i = 0; i < list.length; i++) {
      categories.addAll({
        list[i].serviceType!:
            list.where((e) => e.serviceType == list[i].serviceType).toList(),
      });
    }
  }
}
