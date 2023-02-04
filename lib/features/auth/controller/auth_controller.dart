import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/apis/auth_api.dart';

class AuthController extends GetxController with StateMixin {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  void signIn() async {
    final result = await AuthAPI.login(
      username: usernameCtrl.text,
      password: passwordCtrl.text,
    );
    print(result);
  }

  @override
  void dispose() {
    super.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
  }
}
