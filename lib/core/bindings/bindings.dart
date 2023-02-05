import 'package:get/get.dart';
import 'package:smart_city_getx/features/profile/controller.dart';

import '../../features/app/controller.dart';
import '../../features/auth/controller.dart';
import '../../features/home/controller.dart';
import '../../features/service_category/controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ServiceController>(() => ServiceController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
