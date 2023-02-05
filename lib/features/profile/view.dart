import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/controller.dart';

class ProfilePage extends GetView<AuthController> {
  const ProfilePage(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('个人中心'),
      ),
    );
  }
}
