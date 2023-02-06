import '../models/user.dart';
import '../utils/http.dart';

class UserAPI {
  /// 获取用户信息
  static Future<UserMo> profile() async {
    var response = await HttpUtil().get('/api/common/user/getInfo');
    return UserMo.fromJson(response['user']);
  }
}
