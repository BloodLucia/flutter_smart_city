import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/apis/auth_api.dart';
import 'package:smart_city_getx/core/models/user.dart';
import 'package:smart_city_getx/core/services/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  String token = '';
  final _isLogin = false.obs;
  final _profile = UserMo().obs;

  bool get isLogin => _isLogin.value;
  UserMo get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  /// 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to
        .setString(dotenv.env['STORAGE_USER_TOKEN_KEY']!, value);
    token = value;
    _isLogin.value = true;
  }

  /// 获取用户信息
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    var profile = await AuthAPI.profile();
    _profile(profile);
    _isLogin.value = true;
    StorageService.to.setString(
        dotenv.env['STORAGE_USER_PROFILE_KEY']!, jsonEncode(profile));
  }

  /// 保存用户信息
  Future<void> saveProfile(UserMo profile) async {
    _isLogin.value = true;
    StorageService.to.setString(
        dotenv.env['STORAGE_USER_PROFILE_KEY']!, jsonEncode(profile));
  }

  /// 注销
  Future<void> onLogout() async {
    if (_isLogin.value) await AuthAPI.logout();
    await StorageService.to.remove(dotenv.env['STORAGE_USER_TOKEN_KEY']!);
    _isLogin.value = false;
    token = '';
  }

  @override
  void onInit() {
    super.onInit();

    /// 从本地获取 token
    token = StorageService.to.getString(dotenv.env['STORAGE_USER_TOKEN_KEY']!);

    /// 从本地获取用户信息
    var profileoffline =
        StorageService.to.getString(dotenv.env['STORAGE_USER_PROFILE_KEY']!);
    if (profileoffline.isNotEmpty) {
      _profile(UserMo.fromJson(jsonDecode(profileoffline)));
    }
  }
}
