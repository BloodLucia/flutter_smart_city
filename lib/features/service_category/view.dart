import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCategoriesPage extends GetView {
  const ServiceCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('服务分类页面'),
      ),
    );
  }
}
