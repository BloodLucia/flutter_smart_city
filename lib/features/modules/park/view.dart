import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkPage extends GetView {
  const ParkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('停哪儿'),
      ),
      body: const Center(
        child: Text('停哪儿服务'),
      ),
    );
  }
}
