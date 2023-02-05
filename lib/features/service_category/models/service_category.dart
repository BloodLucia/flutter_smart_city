import 'package:smart_city_getx/core/models/service.dart';

class ServiceCategoryMo {
  String name;
  List<ServiceItem> items;

  ServiceCategoryMo({required this.name, required this.items});

  factory ServiceCategoryMo.fromJson(Map<String, dynamic> json) {
    final myItems = List<ServiceItem>.empty(growable: true);
    return ServiceCategoryMo(name: json['serviceType'], items: myItems);
  }
}
