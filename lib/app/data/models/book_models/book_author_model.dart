class BookAuthorModel {
  int? id;
  int? bookId;
  int? authorId;
  String? createdAt;
  String? updatedAt;
  BookAuthorModel({
    this.id,
    this.bookId,
    this.authorId,
    this.createdAt,
    this.updatedAt,
  });

  BookAuthorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    authorId = json['authorId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['bookId'] = bookId;
    data['authorId'] = authorId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
