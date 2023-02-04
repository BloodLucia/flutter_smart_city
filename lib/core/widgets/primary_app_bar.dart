import 'package:flutter/material.dart';

import '../extensions/extensions.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar({
    Key? key,
    required String title,
    required BuildContext context,
    Color? background,
  }) : super(
          key: key,
          title: Text(title),
          backgroundColor: background ?? context.primaryColor,
        );
}
