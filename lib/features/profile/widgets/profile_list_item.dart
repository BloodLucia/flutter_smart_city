import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    this.left,
    required this.right,
    required this.text,
  });

  final IconData? left;
  final String right;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: context.horizontalMarginLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            right.isEmpty || right == 'null'
                ? Text('未设置', style: TextStyle(color: context.grey))
                : Text(right)
          ],
        ),
      ),
    );
  }
}
