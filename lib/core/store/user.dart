import 'dart:convert';

import 'package:get/get.dart';
import 'package:smart_city_getx/core/apis/auth_api.dart';
import 'package:smart_city_getx/core/apis/user_api.dart';
import 'package:smart_city_getx/core/models/user.dart';
import 'package:smart_city_getx/core/services/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find<UserStore>();

  final _profile = UserMo().obs;

  UserMo get profile => _profile.value;

  @override
  void onReady() {
    super.onReady();
    var profileOffline = StorageService.to.getString('USER_PROFILE');
    if (profileOffline.isNotEmpty) {
      // _profile = Rx<UserMo>(UserMo.fromJson(jsonDecode(profileOffline)));
      _profile(UserMo.fromJson(jsonDecode(profileOffline)));
    }
  }

  // 获取 profile 登录时
  void getProfile() async {
    var user = await UserAPI.profile();
    _profile(user);
    StorageService.to.setString('USER_PROFILE', jsonEncode(user));
  }

  Future updateProfile(dynamic data) async {
    await StorageService.to.remove('USER_PROFILE');
    var user = await UserAPI.update(data);

    user.fold(
      (l) {
        Get.snackbar('提示', l);
      },
      (r) async {
        await StorageService.to.remove('USER_PROFILE');
        _profile(r);
        update();
      },
    );
  }

  // 注销
  void logout() async {
    await AuthAPI.logout();
    await StorageService.to.remove('USER_TOKEN');
    await StorageService.to.remove('USER_PROFILE');
    StorageService.to.setBool('USER_LOGIN_STATUS', false);
    Get.offAndToNamed('/login');
  }
}
