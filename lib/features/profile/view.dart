import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

import '../../core/store/user.dart';
import '../../core/utils/format_sex.dart';
import '../../core/utils/hide_phonenumber.dart';
import '../../core/widgets/rounded_button.dart';
import 'widgets/edit_user_profile.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_list_item.dart';

class ProfilePage extends GetView<UserStore> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.groupedBackground,
      appBar: AppBar(
        title: const Text('个人中心'),
        actions: [
          Padding(
            padding: context.horizontalPaddingLow,
            child: IconButton(
              onPressed: () => Get.to(() => const EditUserProfile()),
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<UserStore>(
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                context.emptySizedHeightBoxNormal,

                /// 用户头像
                ProfileAvatar(
                  sex: UserStore.to.profile.sex!,
                ),
                context.emptySizedHeightBoxNormal,

                ProfileListItem(
                  left: 'UID',
                  right: UserStore.to.profile.userId,
                ),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                  left: '性别',
                  right: formatSex(UserStore.to.profile.sex),
                ),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                  left: '用户名',
                  right: UserStore.to.profile.userName,
                ),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                  left: '昵称',
                  right: UserStore.to.profile.nickName,
                ),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                    left: '手机号',
                    right: hidePhoneNumber(
                      UserStore.to.profile.phonenumber,
                    )),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                  left: '邮箱',
                  right: UserStore.to.profile.email,
                ),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                  left: '身份证号',
                  right: UserStore.to.profile.idCard,
                ),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                  left: '积分',
                  right: UserStore.to.profile.score,
                ),
                context.emptySizedHeightBoxLow,

                ProfileListItem(
                  left: '余额',
                  right: UserStore.to.profile.balance,
                ),

                context.emptySizedHeightBoxLow2x,

                context.emptySizedHeightBoxLow,

                // /// 退出按钮
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
      ),
    );
  }
}
