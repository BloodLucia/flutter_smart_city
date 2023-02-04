import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LivingExpenses extends GetView {
  const LivingExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('生活缴费'),
      ),
      body: const Center(
        child: Text('生活缴费服务'),
      ),
    );
  }
}
