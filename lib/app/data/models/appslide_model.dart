class AppSlides {
  int? id;
  String? source;
  String? title;
  String? linkDirect;
  String? position;
  int? orderId;
  bool? isActive;
  String? type;
  String? createdAt;
  String? updatedAt;
  // List? children;
  AppSlides({
    this.id,
    this.source,
    this.title,
    this.linkDirect,
    this.position,
    this.orderId,
    this.isActive,
    this.type,
    this.createdAt,
    this.updatedAt,
    // this.children,
  });

  AppSlides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    title = json['title'];
    linkDirect = json['linkDirect'];
    position = json['position'];
    orderId = json['orderId'];
    isActive = json['isActive'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // children = json['children'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    data['title'] = title;
    data['linkDirect'] = linkDirect;
    data['position'] = position;
    data['orderId'] = orderId;
    data['isActive'] = isActive;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    // data['children'] = children;
    return data;
  }
}
