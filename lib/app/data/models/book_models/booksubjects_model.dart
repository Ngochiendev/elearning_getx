import 'package:elearning/app/data/models/book_models/book_specify_category_attributes.dart';
import 'package:elearning/app/data/models/book_models/cate_model.dart';

class BookSubjectModel {
  CateModel? cate;
  List<BookSpecifyCategoryAttributesModel>? bookSpecifyCategoryAttributes;
  BookSubjectModel({
    this.cate,
    this.bookSpecifyCategoryAttributes,
  });

  BookSubjectModel.fromJson(Map<String, dynamic> json) {
    cate = json['cate'] != null
        ? CateModel.fromJson(Map<String, dynamic>.from(json['cate']))
        : null;
    if (json['bookSpecifyCategoryAttributes'] != null) {
      bookSpecifyCategoryAttributes = <BookSpecifyCategoryAttributesModel>[];
      json['bookSpecifyCategoryAttributes'].forEach((v) {
        bookSpecifyCategoryAttributes!.add(
            BookSpecifyCategoryAttributesModel.fromJson(
                Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cate != null) {
      data['cate'] = cate!.toJson();
    }
    if (bookSpecifyCategoryAttributes != null) {
      data['bookSpecifyCategoryAttributes'] =
          bookSpecifyCategoryAttributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
