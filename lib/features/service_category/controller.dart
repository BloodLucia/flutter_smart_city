import 'package:get/get.dart';

import '../home/controller.dart';

class ServiceController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  late HomeController homeController;

  @override
  void onInit() {
    super.onInit();
    homeController = Get.find<HomeController>();
  }
}
