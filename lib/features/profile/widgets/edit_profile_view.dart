import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/constants/iconfont.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/core/widgets/opacity_input_decoration.dart';
import 'package:smart_city_getx/core/widgets/rounded_button.dart';
import 'package:smart_city_getx/features/profile/widgets/gender_container.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

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
                /// 选择性别
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: 66,
                    //   height: 66,
                    //   decoration: BoxDecoration(
                    //     borderRadius: context.lowBorderRadius,
                    //     color: context.grey4.withOpacity(0.5),
                    //     border:
                    //         Border.all(color: context.primaryColor, width: 2),
                    //   ),
                    //   child: Icon(IconFont.male, color: context.blue),
                    // ),
                    // context.emptySizedWidthBoxNormal,
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: 66,
                    //   height: 66,
                    //   decoration: BoxDecoration(
                    //     borderRadius: context.lowBorderRadius,
                    //     color: context.grey4.withOpacity(0.5),
                    //     // border: Border.all(
                    //     //   color: context.primaryColor,
                    //     //   width: 2,
                    //     // ),
                    //   ),
                    //   child: Icon(IconFont.female, color: context.pink),
                    // ),
                    GenderContainer(
                      context: context,
                      icon: IconFont.male,
                      isSelected: false,
                      gender: 0,
                    ),
                    context.emptySizedWidthBoxNormal,
                    GenderContainer(
                      context: context,
                      icon: IconFont.female,
                      isSelected: true,
                      gender: 1,
                    ),
                  ],
                ),
                context.emptySizedHeightBoxNormal,
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '昵称'),
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '邮箱'),
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '手机号'),
                      ),
                      context.emptySizedHeightBoxLow2x,
                      TextFormField(
                        decoration: opacityInputDecoration(context)
                            .copyWith(helperText: '身份证号'),
                      ),
                    ],
                  ),
                ),
                context.emptySizedHeightBoxNormal,

                RoundedButton(context: context, text: '保存'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
