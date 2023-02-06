import 'dart:convert';

import 'package:get/get.dart';
import 'package:smart_city_getx/core/apis/auth_api.dart';
import 'package:smart_city_getx/core/apis/user_api.dart';
import 'package:smart_city_getx/core/models/user.dart';
import 'package:smart_city_getx/core/services/storage.dart';

class ProfileController extends GetxController {
  final _profile = UserMo().obs;
  UserMo get profile => _profile.value;
  set profile(UserMo value) => _profile.value = value;

  void logout() async {
    await AuthAPI.logout();
    Get.offNamedUntil('/login', (route) => false);
  }

  void getUserProfile() async {
    if (StorageService.to.getString('USER_PROFILE').isNotEmpty) {
      var json = StorageService.to.getString('USER_PROFILE');
      profile = UserMo.fromJson(jsonDecode(json));
    } else {
      var res = await UserAPI.profile();
      profile = res;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }
}
