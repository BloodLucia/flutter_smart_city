import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/core/store/user.dart';
import 'package:smart_city_getx/core/utils/validators.dart';
import 'package:smart_city_getx/core/widgets/loading_button.dart';

import '../../../core/widgets/opacity_input_decoration.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final nickNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final idCardCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nickNameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    idCardCtrl.dispose();
  }

  void saveProfile() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    var data = {
      'nickName': nickNameCtrl.text,
      'email': emailCtrl.text,
      'phonenumber': phoneCtrl.text,
      'idCard': idCardCtrl.text,
    };

    var newMap = {};

    data.forEach((key, value) {
      if (value != '') {
        newMap[key] = value;
      }
    });

    await UserStore.to.updateProfile(newMap);

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.groupedBackground,
      appBar: AppBar(title: const Text('编辑资料')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: context.horizontalPaddingLow,
            child: Column(
              children: [
                context.emptySizedHeightBoxNormal,
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nickNameCtrl,
                        keyboardType: TextInputType.text,
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '昵称'),
                        validator: (value) {
                          if (!duChineseNickName(value)) {
                            return '昵称只能是中文';
                          }
                          return null;
                        },
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailCtrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '邮箱'),
                        validator: (value) {
                          if (!duIsEmail(value)) {
                            return '邮箱格式有误';
                          }
                          return null;
                        },
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        controller: phoneCtrl,
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '手机号'),
                        validator: (value) {
                          if (!duIsPhone(value)) {
                            return '手机号格式有误';
                          }
                          return null;
                        },
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        controller: idCardCtrl,
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '身份证号'),
                        validator: (value) {
                          if (!duIsIdCard(value)) {
                            return '身份证号格式有误';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                context.emptySizedHeightBoxNormal,
                MyLoadingButton(
                  context: context,
                  text: '保存',
                  onTap: saveProfile,
                  isLoading: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
