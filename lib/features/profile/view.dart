import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/features/profile/widgets/edit_profile_view.dart';
import 'package:smart_city_getx/features/profile/widgets/profile_list_item.dart';

import '../../core/widgets/rounded_button.dart';
import 'controller.dart';
import 'widgets/profile_avatar.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.groupedBackground,
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// 用户头像
                const ProfileAvatar(),
                context.emptySizedHeightBoxNormal,

                /// 用户信息
                const ProfileListItem(text: 'UID', right: Text('1')),
                context.emptySizedHeightBoxLow,
                const ProfileListItem(text: '积分', right: Text('999')),
                context.emptySizedHeightBoxLow,
                const ProfileListItem(text: '余额', right: Text('999.00')),

                context.emptySizedHeightBoxNormal,

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
                    context: context,
                    text: '退出登录',
                    color: Colors.redAccent,
                    onTap: () {
                      Get.defaultDialog(
                        title: '提示',
                        middleText: '您确定要退出登录吗？',
                        textCancel: '取消',
                        textConfirm: '确定',
                        contentPadding: context.paddingNormal,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
