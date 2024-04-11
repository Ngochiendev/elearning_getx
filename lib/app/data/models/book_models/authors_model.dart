import 'package:elearning/app/data/models/book_models/book_author_model.dart';

class AuthorModel {
  int? id;
  String? name;
  String? avatar;
  String? workPlace;
  String? profession;
  String? description;
  String? createdAt;
  String? updatedAt;
  BookAuthorModel? bookAuthorModel;
  AuthorModel(
      {this.id,
      this.name,
      this.avatar,
      this.workPlace,
      this.profession,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.bookAuthorModel});

  AuthorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    workPlace = json['workPlace'];
    profession = json['profession'];
    description = json['description'];
    bookAuthorModel = json['bookAuthorModel'] != null
        ? BookAuthorModel.fromJson(Map<String, dynamic>.from(json['user']))
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['workPlace'] = workPlace;
    data['profession'] = profession;
    data['description'] = description;
    if (bookAuthorModel != null) {
      data['bookAuthorModel'] = bookAuthorModel!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
