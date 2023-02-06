import 'package:smart_city_getx/core/extensions/extensions.dart';

class News {
  int? id;
  String? cover;
  String? title;
  String? content;
  String? publishDate;
  int? commentNum;
  int? likeNum;
  int? readNum;
  String? type;
  String? top;
  String? hot;

  News({
    this.id,
    this.cover,
    this.title,
    this.content,
    this.publishDate,
    this.commentNum,
    this.likeNum,
    this.readNum,
    this.type,
    this.top,
    this.hot,
  });

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'].toString().toImageUrl;
    title = json['title'];
    content = json['content'];
    publishDate = json['publishDate'];
    commentNum = json['commentNum'];
    likeNum = json['likeNum'];
    readNum = json['readNum'];
    type = json['type'];
    top = json['top'];
    hot = json['hot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['cover'] = cover;
    data['title'] = title;
    data['content'] = content;
    data['publishDate'] = publishDate;
    data['commentNum'] = commentNum;
    data['likeNum'] = likeNum;
    data['readNum'] = readNum;
    data['type'] = type;
    data['top'] = top;
    data['hot'] = hot;
    return data;
  }
}
