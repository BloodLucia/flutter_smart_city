import 'package:get/get.dart';

import '../../features/app/controller.dart';
import '../../features/home/controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
