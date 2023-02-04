import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/services/storage_service.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;

  String token = '';

  bool get isLogin => _isLogin.value;

  bool get hasToken => token.isNotEmpty;

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to
        .setString(dotenv.env['STORAGE_USER_TOKEN_KEY']!, value);
    token = value;
  }

  // 注销
  Future<void> onLogout() async {}

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(dotenv.env['STORAGE_USER_TOKEN_KEY']!);
  }
}
