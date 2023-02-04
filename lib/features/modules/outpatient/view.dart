import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutpatientPage extends GetView {
  const OutpatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('门诊预约'),
      ),
      body: const Center(
        child: Text('门诊预约服务'),
      ),
    );
  }
}
