import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class GenderContainer extends GestureDetector {
  GenderContainer({
    Key? key,
    required BuildContext context,
    required IconData icon,
    required bool isSelected,
    required int gender,
    Function(int gender)? onTap,
  }) : super(
          key: key,
          child: Container(
            alignment: Alignment.center,
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              borderRadius: context.lowBorderRadius,
              color: context.grey4.withOpacity(0.5),
              border: Border.all(
                color: isSelected ? context.primaryColor : Colors.transparent,
                width: 2,
              ),
            ),
            child: Icon(icon, color: gender == 0 ? context.blue : context.pink),
          ),
        );
}
