import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView {
  const ProfilePage(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('个人中心页面'),
      ),
    );
  }
}
