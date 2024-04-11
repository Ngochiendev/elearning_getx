import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/book_models/specify_categories_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';

class ModelSearch {
    ModelSearch({
        this.message,
        this.data,
    });

    String? message;
    DataSearch? data;

    factory ModelSearch.fromJson(Map<String, dynamic> json) => ModelSearch(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataSearch.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class DataSearch {
    DataSearch({
        this.books,
        this.pagination,
    });

    List<ListBooksModel>? books;
    Pagination? pagination;

    factory DataSearch.fromJson(Map<String, dynamic> json) => DataSearch(
        books: json["books"] == null ? null : List<ListBooksModel>.from(json["books"].map((x) => ListBooksModel.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "books": books == null ? null : List<dynamic>.from(books!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination!.toJson(),
    };
}
class Pagination {
    Pagination({
        this.total,
        this.page,
        this.perPage,
    });

    int? total;
    int? page;
    int? perPage;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"] == null ? null : json["total"],
        page: json["page"] == null ? null : json["page"],
        perPage: json["perPage"] == null ? null : json["perPage"],
    );

    Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "page": page == null ? null : page,
        "perPage": perPage == null ? null : perPage,
    };
}
class ListBooksModel {
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
  int? ratingAvg;
  int? totalCountRating;
  int?isAlreadyPurchased;
  bool? isAllowTrial;
  int?retailPrice;
  int?discountPrice;
  String? updatedAt;
  List<AuthorModel>? authors;
  List<PurchasePackagesModel>? purchasePackages;
  List<SpecifyCategoriesModel>? specifyCategories;
  ListBooksModel({
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
    this.purchasePackages,
    this.specifyCategories,
    this.discountPrice,this.retailPrice
  });

  ListBooksModel.fromJson(Map<String, dynamic> json) {
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
    ratingAvg=json['ratingAvg']==null?0:json['ratingAvg'];
    totalCountRating=json['totalCountRating']==null?0:json['totalCountRating'];
    isAlreadyPurchased=json['isAlreadyPurchased']==null?0:json['isAlreadyPurchased'];
    isAllowTrial=json['isAllowTrial']==null?0:json['isAllowTrial'];
    isFree = json['isFree'];
    status = json['status'];
    orderId = json['orderId'];
    retailPrice=json['retailPrice'];
    discountPrice=json['discountPrice'];
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
    if (json['purchasePackages'] != null) {
      purchasePackages = <PurchasePackagesModel>[];
      json['purchasePackages'].forEach((v) {
        purchasePackages!
            .add(PurchasePackagesModel.fromJson(Map<String, dynamic>.from(v)));
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
    if (purchasePackages != null) {
      data['purchasePackages'] =
          purchasePackages!.map((v) => v.toJson()).toList();
    }
    if (specifyCategories != null) {
      data['specifyCategories'] =
          specifyCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
