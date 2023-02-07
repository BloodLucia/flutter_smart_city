import 'package:dartz/dartz.dart';

import '../models/user.dart';
import '../utils/http.dart';

class UserAPI {
  /// 获取用户信息
  static Future<UserMo> profile() async {
    var response = await HttpUtil().get('/api/common/user/getInfo');
    return UserMo.fromJson(response['user']);
  }

  /// 更新信息
  static Future<Either<String, UserMo>> update(dynamic data) async {
    var response = await HttpUtil().put('/api/common/user', data: data);
    if (response['code'] == 200) {
      return right(await profile());
    } else {
      return left(response['msg']);
    }
  }
}
