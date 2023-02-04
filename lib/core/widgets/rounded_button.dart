import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/styles/colors.dart';

import '../extensions/extensions.dart';

class RoundedButton extends GestureDetector {
  RoundedButton({
    Key? key,
    required BuildContext context,
    required String text,
    double? width,
    double? height,
    Color? color,
    Color? textColor,
    VoidCallback? onTap,
  }) : super(
          key: key,
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: width ?? double.infinity,
            height: height ?? 50,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: context.lowBorderRadius,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
}
