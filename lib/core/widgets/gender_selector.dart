import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.value,
    required this.icon,
    this.defaultValue,
    required this.onChanged,
  });

  final int value;
  final IconData icon;
  final int? defaultValue;
  final Function(int value) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        alignment: Alignment.center,
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          borderRadius: context.lowBorderRadius,
          color: context.grey4.withOpacity(0.5),
          border: Border.all(
            color: defaultValue == value
                ? context.primaryColor
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Icon(icon, color: value == 0 ? context.blue : context.pink),
      ),
    );
  }
}
