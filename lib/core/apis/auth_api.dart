import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_city_getx/core/services/storage.dart';
import 'package:smart_city_getx/core/utils/http.dart';

import 'user_api.dart';

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
      StorageService.to.setString(dotenv.env['STORAGE_USER_TOKEN_KEY']!, token);

      /// 设置登录状态
      StorageService.to.setBool(dotenv.env['STORAGE_USER_LOGIN_KEY']!, true);

      /// 保存用户信息，这样就不用每次请求用户数据
      var profile = await UserAPI.profile();
      StorageService.to.setString(
          dotenv.env['STORAGE_USER_PROFILE_KEY']!, jsonEncode(profile));

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
    StorageService.to.remove(dotenv.env['STORAGE_USER_TOKEN_KEY']!);
    StorageService.to.remove(dotenv.env['STORAGE_USER_PROFILE_KEY']!);
    StorageService.to.setBool(dotenv.env['STORAGE_USER_LOGIN_KEY']!, false);
    await HttpUtil().post('/logout');
  }
}
