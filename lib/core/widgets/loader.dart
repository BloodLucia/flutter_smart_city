import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.primaryColor,
      ),
    );
  }
}
