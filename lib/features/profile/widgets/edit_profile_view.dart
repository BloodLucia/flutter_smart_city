import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/core/widgets/rounded_button.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('编辑资料')),
      body: SafeArea(
        child: Padding(
          padding: context.horizontalMarginLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefix: Text('昵称'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    TextFormField(),
                    context.emptySizedHeightBoxLow,
                    TextFormField(),
                    context.emptySizedHeightBoxLow,
                    TextFormField(),
                    context.emptySizedHeightBoxLow,
                    TextFormField(),
                  ],
                ),
              ),
              RoundedButton(context: context, text: '保存'),
            ],
          ),
        ),
      ),
    );
  }
}
