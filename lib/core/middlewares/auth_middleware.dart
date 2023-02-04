import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/routes/names.dart';
import 'package:smart_city_getx/core/services/user_store.dart';

class AuthMiddleware implements GetMiddleware {
  @override
  int? priority = 0;

  AuthMiddleware({required this.priority});

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    throw UnimplementedError();
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    throw UnimplementedError();
  }

  @override
  Widget onPageBuilt(Widget page) {
    throw UnimplementedError();
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    throw UnimplementedError();
  }

  @override
  void onPageDispose() {}

  @override
  RouteSettings? redirect(String? route) {
    // 如果已经登录
    if (UserStore.to.isLogin ||
        route == RouteNames.SIGN_IN ||
        route == RouteNames.SIGN_UP ||
        route == RouteNames.INITIAL) {
      return null;
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () => Get.snackbar('提示', '登录已过期，请重新登录！'),
      );
      // 跳转到登录页
      return const RouteSettings(name: RouteNames.SIGN_IN);
    }
  }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) {
    throw UnimplementedError();
  }
}
