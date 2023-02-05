import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/rounded_button.dart';
import 'controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: RoundedButton(
          context: context,
          text: '注销',
          onTap: controller.logout,
        ),
      ),
    );
  }
}
