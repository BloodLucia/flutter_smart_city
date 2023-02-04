import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: context.normalBorderRadius,
        color: Colors.white.withOpacity(0.5),
      ),
      child: Text(text),
    );
  }
}
