import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/apis/auth_api.dart';

class SignUpController extends GetxController {
  final _genderValue = 0.obs;
  get genderValue => _genderValue.value;
  set genderValue(value) => _genderValue.value = value;

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  late final TextEditingController signUpUserNameCtrl;
  late final TextEditingController signUpPasswordCtrl;
  late final TextEditingController signUpPhoneNumCtrl;

  // 选择性別
  void genderOnChanged(int value) {
    genderValue = value;
  }

  // 注册
  void signUp() async {
    isLoading = true;
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
    isLoading = false;
  }

  @override
  void dispose() {
    super.dispose();
    signUpPhoneNumCtrl.dispose();
    signUpUserNameCtrl.dispose();
    signUpPasswordCtrl.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    signUpPhoneNumCtrl = TextEditingController();
    signUpUserNameCtrl = TextEditingController();
    signUpPasswordCtrl = TextEditingController();
  }
}
