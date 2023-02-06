import '../extensions/extensions.dart';

class ServiceItem {
  int? id;
  String? serviceName;
  String? serviceDesc;
  String? serviceType;
  String? imgUrl;
  int? pid;
  String? link;
  int? sort;
  String? isRecommend;

  ServiceItem({
    this.id,
    this.serviceName,
    this.serviceDesc,
    this.serviceType,
    this.imgUrl,
    this.pid,
    this.link,
    this.sort,
    this.isRecommend,
  });

  ServiceItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
    serviceDesc = json['serviceDesc'];
    serviceType = json['serviceType'];
    imgUrl = json['imgUrl'].toString().toImageUrl;
    pid = json['pid'];

    ///  park/index  => park index
    link = json['link'].toString().split('/')[0];
    sort = json['sort'];
    isRecommend = json['isRecommend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['serviceName'] = serviceName;
    data['serviceDesc'] = serviceDesc;
    data['serviceType'] = serviceType;
    data['imgUrl'] = imgUrl;
    data['pid'] = pid;
    data['link'] = link;
    data['sort'] = sort;
    data['isRecommend'] = isRecommend;
    return data;
  }
}
