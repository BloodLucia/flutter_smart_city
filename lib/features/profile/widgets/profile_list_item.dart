import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    this.left,
    this.right,
    required this.text,
  });

  final IconData? left;
  final Widget? right;
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
            Row(
              children: [
                const Icon(Icons.person),
                context.emptySizedWidthBoxLow,
                Text(text),
              ],
            ),
            right ?? Container(),
          ],
        ),
      ),
    );
  }
}
