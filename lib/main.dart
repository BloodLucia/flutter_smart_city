import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/bindings.dart';
import 'core/routes/routes.dart';
import 'core/styles/theme.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(
      const MyApp(),
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
      initialRoute: '/app',
      initialBinding: AppBindings(),
      navigatorObservers: [AppRoutes.observer],
      getPages: AppRoutes.pages,
    );
  }
}
