import 'package:smart_city_getx/core/extensions/extensions.dart';

class Rotation {
  int? id;
  String? appType;
  String? status;
  int? sort;
  String? advTitle;
  String? advImg;
  String? servModule;
  int? targetId;
  String? type;

  Rotation({
    this.id,
    this.appType,
    this.status,
    this.sort,
    this.advTitle,
    this.advImg,
    this.servModule,
    this.targetId,
    this.type,
  });

  Rotation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appType = json['appType'];
    status = json['status'];
    sort = json['sort'];
    advTitle = json['advTitle'];
    advImg = json['advImg'].toString().toImageUrl;
    servModule = json['servModule'];
    targetId = json['targetId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appType'] = appType;
    data['status'] = status;
    data['sort'] = sort;
    data['advTitle'] = advTitle;
    data['advImg'] = advImg;
    data['servModule'] = servModule;
    data['targetId'] = targetId;
    data['type'] = type;
    return data;
  }
}
