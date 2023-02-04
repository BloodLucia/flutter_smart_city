import 'package:get/get.dart';
import 'package:smart_city_getx/features/auth/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
