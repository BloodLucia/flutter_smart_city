import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MetroQueryPage extends GetView {
  const MetroQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('城市地铁'),
      ),
      body: const Center(
        child: Text('城市地铁服务'),
      ),
    );
  }
}
