import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/services/storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // 如果已经登录
    if (StorageService.to.getBool(dotenv.env['STORAGE_USER_LOGIN_KEY']!) ||
        route == '/login') {
      return null;
    } else {
      // 跳转到登录页
      return const RouteSettings(name: '/login');
    }
  }
}
