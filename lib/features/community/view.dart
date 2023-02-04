import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityPage extends GetView {
  const CommunityPage(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('社区页面'),
      ),
    );
  }
}
