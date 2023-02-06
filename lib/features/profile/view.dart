import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/core/utils/hide_phonenumber.dart';

import '../../core/widgets/rounded_button.dart';
import 'controller.dart';
import 'widgets/edit_profile_view.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_list_item.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.groupedBackground,
      appBar: AppBar(title: const Text('个人中心')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.emptySizedHeightBoxNormal,

              /// 用户头像
              ProfileAvatar(
                onPressed: controller.pickImage,
              ),
              context.emptySizedHeightBoxNormal,

              ProfileListItem(
                  text: 'UID', right: controller.user.value.userId.toString()),
              context.emptySizedHeightBoxLow,

              ProfileListItem(
                  text: '用户名',
                  right: controller.user.value.userName.toString()),
              context.emptySizedHeightBoxLow,

              ProfileListItem(
                  text: '昵称', right: controller.user.value.nickName.toString()),
              context.emptySizedHeightBoxLow,

              ProfileListItem(
                text: '手机号',
                right: hidePhoneNumber(
                    controller.user.value.phonenumber.toString()),
              ),
              context.emptySizedHeightBoxLow,

              ProfileListItem(
                  text: '邮箱', right: controller.user.value.email.toString()),
              context.emptySizedHeightBoxLow,

              ProfileListItem(
                  text: '身份证号', right: controller.user.value.idCard.toString()),
              context.emptySizedHeightBoxLow,

              ProfileListItem(
                  text: '积分', right: controller.user.value.score.toString()),
              context.emptySizedHeightBoxLow,

              ProfileListItem(
                  text: '余额', right: controller.user.value.balance.toString()),
              context.emptySizedHeightBoxLow,

              context.emptySizedHeightBoxLow2x,

              /// 编辑资料按钮
              Padding(
                padding: context.horizontalPaddingLow,
                child: RoundedButton(
                  context: context,
                  text: '编辑资料',
                  color: context.primaryColor,
                  onTap: () => Get.to(() => const EditProfileView()),
                ),
              ),

              context.emptySizedHeightBoxLow,

              /// 退出按钮
              Padding(
                padding: context.horizontalPaddingLow,
                child: RoundedButton(
                  color: Colors.redAccent,
                  text: '退出登录',
                  context: context,
                  onTap: controller.logout,
                ),
              ),

              context.emptySizedHeightBoxNormal,
            ],
          ),
        ),
      ),
    );
  }
}
