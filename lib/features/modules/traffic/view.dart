import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrafficPage extends GetView {
  const TrafficPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('智慧交管'),
      ),
      body: const Center(
        child: Text('智慧交管服务'),
      ),
    );
  }
}
