import 'package:get/get.dart';
import 'package:smart_city_getx/features/profile/controller.dart';

import 'controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
