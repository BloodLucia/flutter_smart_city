import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/widgets/special_image.dart';

Widget handleErrorImage(String imageUrl) {
  if (!imageUrl.endsWith('null')) {
    return SpecialImage(url: imageUrl);
  } else {
    return Image.asset(
      'assets/images/iphone.jpg',
      fit: BoxFit.cover,
    );
  }
}
