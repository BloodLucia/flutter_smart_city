import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/core/widgets/opacity_input_decoration.dart';
import 'package:smart_city_getx/core/widgets/rounded_button.dart';

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
                  children: const [
                    // GenderSelector(
                    //   value: 0,
                    //   icon: IconFont.male,
                    //   onChanged: (value) {
                    //     print(value);
                    //   },
                    // ),
                    // context.emptySizedWidthBoxNormal,
                    // GenderSelector(
                    //   value: 1,
                    //   icon: IconFont.female,
                    //   onChanged: (value) {
                    //     print(value);
                    //   },
                    // ),
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

                RoundedButton(
                  context: context,
                  text: '保存',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
