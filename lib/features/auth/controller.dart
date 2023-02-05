import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/services/storage_service.dart';
import 'package:smart_city_getx/core/services/user_store.dart';

import '../../core/apis/auth_api.dart';

class AuthController extends GetxController {
  late final TextEditingController usernameCtrl;
  late final TextEditingController passwordCtrl;

  void login() async {
    final result = await AuthAPI.login(
        username: usernameCtrl.text, password: passwordCtrl.text);

    result.fold(
      (l) {
        Get.snackbar('提示', l.toString());
      },
      (r) {
        StorageService.to.setBool('isLogin', true);
        Get.offAllNamed('/app');
      },
    );
  }

  void logout() async {
    Get.offNamed('/login');
    await UserStore.to.onLogout();
  }

  @override
  void dispose() {
    super.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }
}
