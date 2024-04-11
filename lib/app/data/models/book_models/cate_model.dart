class CateModel {
  int? id;
  String? name;
  String? slug;
  String? type;
  bool? isHomeDisplayed;
  String? createdAt;
  String? updatedAt;
  CateModel({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.isHomeDisplayed,
    this.createdAt,
    this.updatedAt,
  });

  CateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    isHomeDisplayed = json['isHomeDisplayed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['type'] = type;
    data['isHomeDisplayed'] = isHomeDisplayed;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
