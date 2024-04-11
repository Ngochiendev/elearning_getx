import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/book_models/specify_categories_model.dart';

class BookSaleModel {
  int? id;
  String? title;
  String? slug;
  String? ownerId;
  String? cover;
  String? tableOfContentImage;
  String? freePdf;
  String? background;
  String? briefDescription;
  String? description;
  bool? isFree;
  String? status;
  int? orderId;
  bool? tableOfContentIsPicture;
  bool? isHighlight;
  String? createdAt;
  String? updatedAt;
  List<AuthorModel>? authors;
  List<SpecifyCategoriesModel>? specifyCategories;
  BookSaleModel({
    this.id,
    this.title,
    this.slug,
    this.ownerId,
    this.cover,
    this.tableOfContentImage,
    this.freePdf,
    this.background,
    this.briefDescription,
    this.description,
    this.isFree,
    this.status,
    this.orderId,
    this.tableOfContentIsPicture,
    this.isHighlight,
    this.createdAt,
    this.updatedAt,
    this.authors,
    this.specifyCategories,
  });

  BookSaleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    ownerId = json['ownerId'];
    cover = json['cover'];
    tableOfContentImage = json['tableOfContentImage'];
    freePdf = json['freePdf'];
    background = json['background'];
    briefDescription = json['briefDescription'];
    description = json['description'];
    isFree = json['isFree'];
    status = json['status'];
    orderId = json['orderId'];
    tableOfContentIsPicture = json['tableOfContentIsPicture'];
    isHighlight = json['isHighlight'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['authors'] != null) {
      authors = <AuthorModel>[];
      json['authors'].forEach((v) {
        authors!.add(AuthorModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }

    if (json['specifyCategories'] != null) {
      specifyCategories = <SpecifyCategoriesModel>[];
      json['specifyCategories'].forEach((v) {
        specifyCategories!
            .add(SpecifyCategoriesModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['ownerId'] = ownerId;
    data['cover'] = cover;
    data['tableOfContentImage'] = tableOfContentImage;
    data['background'] = background;
    data['briefDescription'] = briefDescription;
    data['description'] = description;
    data['isFree'] = isFree;
    data['status'] = status;
    data['orderId'] = orderId;
    data['tableOfContentIsPicture'] = tableOfContentIsPicture;
    data['isHighlight'] = isHighlight;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    if (specifyCategories != null) {
      data['specifyCategories'] =
          specifyCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
