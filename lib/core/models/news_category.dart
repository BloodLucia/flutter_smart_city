class NewsCategory {
  int? id;
  String? appType;
  String? name;
  int? sort;
  bool? isSelected = false;

  NewsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appType = json['appType'];
    name = json['name'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['appType'] = appType;
    data['name'] = name;
    data['sort'] = sort;
    return data;
  }
}
