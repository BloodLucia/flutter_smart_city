import 'package:get/get.dart';

import '../controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
