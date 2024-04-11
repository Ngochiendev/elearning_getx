class UploadImageModel {
  String? id;
  String? url;
  int? size;
  String? type;
  String? category;
  UploadImageModel({
    this.id,
    this.url,
    this.size,
    this.type,
    this.category,
  });

  UploadImageModel.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    url = json['url'];
    size = json['size'];
    type = json['file_type'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['id'] = id;
    data['url'] = url;
    data['size'] = size;
    data['file_type'] = type;
    data['category'] = category;
    return data;
  }
}
