import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/constants/iconfont.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/core/widgets/gender_selector.dart';
import 'package:smart_city_getx/core/widgets/rounded_button.dart';

import 'controller.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              padding: context.horizontalPaddingNormal,
              child: Obx(
                () => Form(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GenderSelector(
                            value: 0,
                            defaultValue: controller.genderValue,
                            icon: IconFont.male,
                            onChanged: controller.genderOnChanged,
                          ),
                          context.emptySizedWidthBoxNormal,
                          GenderSelector(
                            defaultValue: controller.genderValue,
                            value: 1,
                            icon: IconFont.female,
                            onChanged: controller.genderOnChanged,
                          ),
                        ],
                      ),
                      context.emptySizedHeightBoxLow2x,
                      Text('点击图标可以切换性别哦~',
                          style: TextStyle(color: context.grey2)),
                      context.emptySizedHeightBoxNormal,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: '手机号',
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '请填写手机号';
                          }
                          if (!GetUtils.isPhoneNumber(value)) {
                            return '手机号格式有误';
                          }
                          return null;
                        },
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: '用户名',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '请填写用户名';
                          }
                          return null;
                        },
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: '密码',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '请填写密码';
                          }

                          if (value.length < 6) {
                            return '密码不能小于 6 个字符';
                          }
                          return null;
                        },
                      ),
                      context.emptySizedHeightBoxNormal,
                      RoundedButton(
                        context: context,
                        text: '注册',
                        onTap: () {
                          print('hello');
                        },
                      ),
                      context.emptySizedHeightBoxLow3x,
                      RichText(
                        text: TextSpan(
                          text: '已经有账号了？',
                          style: TextStyle(color: context.grey, fontSize: 16),
                          children: [
                            TextSpan(
                              text: '我要登录',
                              style: TextStyle(
                                color: context.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed('/login'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
