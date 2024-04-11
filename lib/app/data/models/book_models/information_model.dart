class InformationBookModel {
  int? id;
  int? bookId;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;
  InformationBookModel({
    this.id,
    this.bookId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  InformationBookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    key = json['key'];
    value = json['value'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['bookId'] = bookId;
    data['key'] = key;
    data['value'] = value;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
