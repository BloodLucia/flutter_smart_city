import 'package:smart_city_getx/core/constants/path_constants.dart';
import 'package:smart_city_getx/core/utils/http.dart';

class AuthAPI {
  static Future login({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> params = {
      'userName': username,
      'password': password,
    };
    var response = await HttpUtil().post(
      PathConstants.SIGN_IN_PATH,
      data: params,
    );
    if (response != null) {
      return response;
    }
  }
}
