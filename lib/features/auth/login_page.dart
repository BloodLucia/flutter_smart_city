import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/rounded_button.dart';
import '../../../core/extensions/extensions.dart';
import 'controller.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: context.horizontalPaddingNormal,
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: 250,
                    child: Image.asset(
                      'assets/illustrations/flow-rafiki.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  context.emptySizedHeightBoxLow2x,
                  TextFormField(
                    controller: controller.usernameCtrl,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: '用户名',
                    ),
                  ),
                  context.emptySizedHeightBoxLow2x,
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordCtrl,
                      obscureText: controller.hidePwd,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              controller.hidePwd = !controller.hidePwd,
                          icon: controller.hidePwd
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        labelText: '密码',
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxNormal,
                  RoundedButton(
                    context: context,
                    text: '登录',
                    onTap: controller.login,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  RichText(
                    text: TextSpan(
                      text: '还没有账号？',
                      style: TextStyle(color: context.grey, fontSize: 16),
                      children: [
                        TextSpan(
                            text: '立即注册',
                            style: TextStyle(
                              color: context.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed('/signup')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
