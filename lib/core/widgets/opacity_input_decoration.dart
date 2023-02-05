import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

InputDecoration opacityInputDecoration(BuildContext context) {
  return InputDecoration(
    filled: true,
    fillColor: context.grey4.withOpacity(0.5),
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
  );
}
