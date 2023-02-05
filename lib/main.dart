import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/services/storage_service.dart';

import 'core/bindings/bindings.dart';
import 'core/routes/routes.dart';
import 'core/styles/theme.dart';
import 'global.dart';

void main() async {
  await Global.init();
  bool isLogin = StorageService.to.getBool('isLogin');
  runApp(
    DevicePreview(
      builder: (context) => MyApp(
        isLogin: isLogin,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, this.isLogin = false});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      title: 'Material App',
      initialRoute: isLogin ? '/app' : '/login',
      initialBinding: AppBindings(),
      getPages: AppRoutes.pages,
    );
  }
}
