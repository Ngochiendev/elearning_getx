class BookSpecifyCategoriesModel {
  int? id;
  int? bookId;
  int? specifyCategoryId;
  String? createdAt;
  String? updatedAt;
  BookSpecifyCategoriesModel({
    this.id,
    this.bookId,
    this.specifyCategoryId,
    this.createdAt,
    this.updatedAt,
  });

  BookSpecifyCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    specifyCategoryId = json['specifyCategoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['bookId'] = bookId;
    data['specifyCategoryId'] = specifyCategoryId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
