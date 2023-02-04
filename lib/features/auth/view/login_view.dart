import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/features/auth/controller/auth_controller.dart';

import '../../../core/styles/colors.dart';
import '../../../core/widgets/rounded_button.dart';
import '../../../core/extensions/extensions.dart';

class LoginView extends GetView<AuthController> {
  LoginView({super.key});

  final usernameController = TextEditingController(text: 'niaogu');
  final passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: '用户名',
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off),
                      ),
                      labelText: '密码',
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  RoundedButton(
                    context: context,
                    text: '登录',
                    onTap: controller.signIn,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  RichText(
                    text: TextSpan(
                      text: '还没有账号？',
                      style: TextStyle(color: context.grey, fontSize: 16),
                      children: const [
                        TextSpan(
                          text: '立即注册',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
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
