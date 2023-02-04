import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/features/service_category/controller.dart';

class ServiceCategoriesPage extends GetView<ServiceController> {
  const ServiceCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('服务'),
        ),
        body: const SafeArea(
          child: Center(
            child: Text('服务页面'),
          ),
        ));
  }
}
