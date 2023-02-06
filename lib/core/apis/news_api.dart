import 'package:smart_city_getx/core/utils/http.dart';

class NewsAPI {
  static Future fetchCommentList() async {
    var response = await HttpUtil().get('/press/comments/list');
  }
}
