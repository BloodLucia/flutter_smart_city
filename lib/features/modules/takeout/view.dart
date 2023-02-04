import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeOutPage extends GetView {
  const TakeOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('外卖订餐'),
      ),
      body: const Center(
        child: Text('外卖订餐服务'),
      ),
    );
  }
}
