import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class MyLoadingButton extends GestureDetector {
  MyLoadingButton({
    Key? key,
    required String text,
    required BuildContext context,
    required bool isLoading,
    double? width,
    double? height,
    Color? textColor,
    Color? color,
    VoidCallback? onTap,
  }) : super(
          key: key,
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: width ?? double.infinity,
            height: height ?? 50,
            decoration: BoxDecoration(
              color: isLoading
                  ? context.primaryColor.withOpacity(0.2)
                  : context.primaryColor,
              borderRadius: context.lowBorderRadius,
            ),
            child: isLoading
                ? CircularProgressIndicator(
                    color: context.primaryColor, strokeWidth: 2.0)
                : Text(
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
