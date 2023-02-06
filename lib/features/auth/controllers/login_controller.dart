import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/apis/auth_api.dart';
import '../../../core/services/storage.dart';

class LoginController extends GetxController {
  late final TextEditingController usernameCtrl;
  late final TextEditingController passwordCtrl;

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  void login() async {
    isLoading = true;
    final result = await AuthAPI.login(
        username: usernameCtrl.text, password: passwordCtrl.text);

    result.fold(
      (l) {
        Get.snackbar('提示', l.toString());
      },
      (r) {
        StorageService.to.setBool('isLogin', true);
        Get.offNamedUntil('/app', (route) => false);
      },
    );
    isLoading = false;
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
