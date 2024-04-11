class CategoryCourse {
  // List? children;
  CategoryCourse({
    this.id,
    this.parentId,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    // this.children,
  });

  CategoryCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // children = json['children'];
  }

  String? createdAt;
  int? id;
  String? name;
  int? parentId;
  String? slug;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['parentId'] = parentId;
    data['name'] = name;
    data['slug'] = slug;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    // data['children'] = children;
    return data;
  }
}
