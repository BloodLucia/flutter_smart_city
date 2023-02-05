import 'package:get/get.dart';
import 'package:smart_city_getx/core/apis/auth_api.dart';
import 'package:smart_city_getx/core/services/storage_service.dart';

class ProfileController extends GetxController {
  void logout() async {
    await AuthAPI.logout();
    StorageService.to.setBool('isLogin', false);
    Get.offAllNamed('/login');
  }
}
