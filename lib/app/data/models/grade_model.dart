class GradeModel {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;
  GradeModel({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  GradeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
