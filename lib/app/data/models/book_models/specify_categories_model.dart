import 'package:elearning/app/data/models/book_models/book_specify_category_model.dart';

class SpecifyCategoriesModel {
  int? id;
  String? name;
  String? slug;
  String? type;
  bool? isHomeDisplayed;
  String? createdAt;
  String? updatedAt;
  List<BookSpecifyCategoriesModel>? bookSpecifyCategoriesModel;
  SpecifyCategoriesModel(
      {this.id,
      this.name,
      this.slug,
      this.isHomeDisplayed,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.bookSpecifyCategoriesModel});

  SpecifyCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    isHomeDisplayed = json['isHomeDisplayed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookSpecifyCategoriesModel'] != null) {
      bookSpecifyCategoriesModel = <BookSpecifyCategoriesModel>[];
      json['bookSpecifyCategoriesModel'].forEach((v) {
        bookSpecifyCategoriesModel!.add(
            BookSpecifyCategoriesModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
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
    if (bookSpecifyCategoriesModel != null) {
      data['bookSpecifyCategoriesModel'] =
          bookSpecifyCategoriesModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
