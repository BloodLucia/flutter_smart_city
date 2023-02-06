import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/services/storage.dart';
import 'package:smart_city_getx/core/services/user_store.dart';

import '../../core/apis/auth_api.dart';

class AuthController extends GetxController {
  late final TextEditingController usernameCtrl;
  late final TextEditingController passwordCtrl;
  late final TextEditingController signUpUserNameCtrl;
  late final TextEditingController signUpPasswordCtrl;
  late final TextEditingController signUpPhoneNumCtrl;

  final _hidePwd = true.obs;
  get hidePwd => _hidePwd.value;
  set hidePwd(value) => _hidePwd.value = value;
  final _genderValue = 0.obs;
  get genderValue => _genderValue.value;
  set genderValue(value) => _genderValue.value = value;

  void login() async {
    final result = await AuthAPI.login(
        username: usernameCtrl.text, password: passwordCtrl.text);

    result.fold(
      (l) {
        Get.snackbar('提示', l.toString());
      },
      (r) {
        StorageService.to.setBool('isLogin', true);
        Get.offAndToNamed('/app');
      },
    );
  }

  // 注册
  void signUp() async {
    final response = await AuthAPI.signUp(
      phoneNumber: signUpPhoneNumCtrl.text,
      userName: signUpUserNameCtrl.text,
      password: signUpPasswordCtrl.text,
      sex: genderValue.toString(),
    );
    response.fold(
      (l) => Get.snackbar('错误', l),
      (r) {
        Get.snackbar('提示', '注册成功，请登录');
        Get.toNamed('/login');
      },
    );
  }

  void logout() async {
    Get.offAndToNamed('/login');
    await UserStore.to.onLogout();
  }

  // 选择性別
  void genderOnChanged(int value) {
    genderValue = value;
  }

  @override
  void dispose() {
    super.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    signUpPhoneNumCtrl.dispose();
    signUpUserNameCtrl.dispose();
    signUpPasswordCtrl.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    signUpPhoneNumCtrl = TextEditingController();
    signUpUserNameCtrl = TextEditingController();
    signUpPasswordCtrl = TextEditingController();
  }
}
