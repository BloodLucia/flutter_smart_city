import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:smart_city_getx/core/models/user.dart';
import 'package:smart_city_getx/core/utils/http.dart';

import '../services/user_store.dart';

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
      // token
      String token = res['token'];
      // 保存 token
      UserStore.to.setToken(token);
      return right(null);
    } else {
      return left('用户不存在或密码错误');
    }
  }

  /// 注册
  static Future signUp() async {}

  /// 获取用户信息
  static Future<UserMo> profile() async {
    var response = await HttpUtil().get('/api/common/user/getInfo');
    return UserMo.fromJson(response['user']);
  }

  /// 登出
  static Future logout() async {
    await HttpUtil().post('/logout');
  }
}
