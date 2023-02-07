import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:smart_city_getx/core/services/storage.dart';
import 'package:smart_city_getx/core/store/user.dart';
import 'package:smart_city_getx/core/utils/http.dart';

class AuthAPI {
  /// 登录
  static Future<Either<String, void>> login({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> params = {
      'username': username,
      'password': password,
    };

    var res = await HttpUtil().post('/api/login', data: jsonEncode(params));
    if (res['code'] == 200 && res['token'] != null) {
      /// token
      String token = res['token'];

      /// 保存 token
      StorageService.to.setString('USER_TOKEN', token);

      /// 设置登录状态
      StorageService.to.setBool('USER_LOGIN_STATUS', true);

      /// 保存用户信息
      UserStore.to.getProfile();

      return right(null);
    } else {
      return left('用户不存在或密码错误');
    }
  }

  /// 注册
  static Future<Either<String, void>> signUp({
    required String phoneNumber,
    required String userName,
    required String password,
    required String sex,
  }) async {
    Map<String, dynamic> data = {
      'phonenumber': phoneNumber,
      'userName': userName,
      'password': password,
      'sex': sex,
    };
    var response =
        await HttpUtil().post('/api/register', data: jsonEncode(data));
    if (response['code'] == 200) {
      return right(null);
    } else if (response['code'] == 500) {
      return left(response['msg'].toString().split('，')[1]);
    } else {
      return left('未知错误');
    }
  }

  /// 登出
  static Future logout() async {
    await HttpUtil().post('/logout');
  }
}
