import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard({super.key, this.height, required this.child});

  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    throw Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      width: context.width,
      height: height ?? 200,
      decoration: const BoxDecoration(),
      child: child,
    );
  }
}
