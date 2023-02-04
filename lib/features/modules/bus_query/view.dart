import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusQueryPage extends GetView {
  const BusQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('智慧巴士'),
      ),
      body: const Center(
        child: Text('智慧巴士服务'),
      ),
    );
  }
}
