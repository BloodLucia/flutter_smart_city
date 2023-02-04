import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/names.dart';
import 'core/routes/routes.dart';
import 'core/styles/theme.dart';
import 'global.dart';
import 'core/bindings/bindings.dart';

void main() async {
  Global.init();
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      title: 'Material App',
      initialRoute: RouteNames.APP,
      initialBinding: AppBindings(),
      getPages: AppRoutes.pages,
    );
  }
}
