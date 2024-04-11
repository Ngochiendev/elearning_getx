// To parse this JSON data, do
//
//     final myrating = myratingFromJson(jsonString);

import 'dart:convert';

Myrating myratingFromJson(String str) => Myrating.fromJson(json.decode(str));

String myratingToJson(Myrating data) => json.encode(data.toJson());

class Myrating {
  Myrating({
    this.message,
    this.data,
  });

  String? message;
  DataHome? data;

  factory Myrating.fromJson(Map<String, dynamic> json) => Myrating(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataHome.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataHome {
  DataHome({
    this.banners,
    this.bookSubjects,
    this.bookSales,
    this.bookCategoryIsHomeDisplayed,
  });

  Banners? banners;
  List<BookSubject>? bookSubjects;
  List<BookHome>? bookSales;
  List<BookCategoryIsHomeDisplayed>? bookCategoryIsHomeDisplayed;

  factory DataHome.fromJson(Map<String, dynamic> json) => DataHome(
        banners:
            json["banners"] == null ? null : Banners.fromJson(json["banners"]),
        bookSubjects: json["bookSubjects"] == null
            ? null
            : List<BookSubject>.from(
                json["bookSubjects"].map((x) => BookSubject.fromJson(x))),
        bookSales: json["bookSales"] == null
            ? null
            : List<BookHome>.from(
                json["bookSales"].map((x) => BookHome.fromJson(x))),
        bookCategoryIsHomeDisplayed: json["bookCategoryIsHomeDisplayed"] == null
            ? null
            : List<BookCategoryIsHomeDisplayed>.from(
                json["bookCategoryIsHomeDisplayed"]
                    .map((x) => BookCategoryIsHomeDisplayed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": banners == null ? null : banners!.toJson(),
        "bookSubjects": bookSubjects == null
            ? null
            : List<dynamic>.from(bookSubjects!.map((x) => x.toJson())),
        "bookSales": bookSales == null
            ? null
            : List<dynamic>.from(bookSales!.map((x) => x.toJson())),
        "bookCategoryIsHomeDisplayed": bookCategoryIsHomeDisplayed == null
            ? null
            : List<dynamic>.from(
                bookCategoryIsHomeDisplayed!.map((x) => x.toJson())),
      };
}

class Banners {
  Banners({
    this.topBanners,
    this.middleBanners,
    this.appBanners,
    this.appSlides,
    this.leftBanner,
    this.rightBanner,
  });

  List<AppBanner>? topBanners;
  List<AppBanner>? middleBanners;
  List<AppBanner>? appBanners;
  List<AppBanner>? appSlides;
  List<AppBanner>? leftBanner;
  List<AppBanner>? rightBanner;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        topBanners: json["topBanners"] == null
            ? null
            : List<AppBanner>.from(
                json["topBanners"].map((x) => AppBanner.fromJson(x))),
        middleBanners: json["middleBanners"] == null
            ? null
            : List<AppBanner>.from(
                json["middleBanners"].map((x) => AppBanner.fromJson(x))),
        appBanners: json["appBanners"] == null
            ? null
            : List<AppBanner>.from(
                json["appBanners"].map((x) => AppBanner.fromJson(x))),
        appSlides: json["appSlides"] == null
            ? null
            : List<AppBanner>.from(
                json["appSlides"].map((x) => AppBanner.fromJson(x))),
        leftBanner: json["leftBanner"] == null
            ? null
            : List<AppBanner>.from(
                json["leftBanner"].map((x) => AppBanner.fromJson(x))),
        rightBanner: json["rightBanner"] == null
            ? null
            : List<AppBanner>.from(
                json["rightBanner"].map((x) => AppBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topBanners": topBanners == null
            ? null
            : List<dynamic>.from(topBanners!.map((x) => x.toJson())),
        "middleBanners": middleBanners == null
            ? null
            : List<dynamic>.from(middleBanners!.map((x) => x.toJson())),
        "appBanners": appBanners == null
            ? null
            : List<dynamic>.from(appBanners!.map((x) => x.toJson())),
        "appSlides": appSlides == null
            ? null
            : List<dynamic>.from(appSlides!.map((x) => x.toJson())),
        "leftBanner": leftBanner == null
            ? null
            : List<dynamic>.from(leftBanner!.map((x) => x.toJson())),
        "rightBanner": rightBanner == null
            ? null
            : List<dynamic>.from(rightBanner!.map((x) => x.toJson())),
      };
}

class AppBanner {
  AppBanner({
    this.source,
    this.id,
    this.title,
    this.linkDirect,
    this.position,
    this.orderId,
    this.isActive,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  String? source;
  int? id;
  String? title;
  String? linkDirect;
  String? position;
  int? orderId;
  bool? isActive;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory AppBanner.fromJson(Map<String, dynamic> json) => AppBanner(
        source: json["source"] == null ? null : json["source"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        linkDirect: json["linkDirect"] == null ? null : json["linkDirect"],
        position: json["position"] == null ? null : json["position"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source == null ? null : source,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "linkDirect": linkDirect == null ? null : linkDirect,
        "position": position == null ? null : position,
        "orderId": orderId == null ? null : orderId,
        "isActive": isActive == null ? null : isActive,
        "type": type == null ? null : type,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class BookCategoryIsHomeDisplayed {
  BookCategoryIsHomeDisplayed({
    this.cate,
    this.books,
  });

  BookCategoryIsHomeDisplayedCate? cate;
  List<BookHome>? books;

  factory BookCategoryIsHomeDisplayed.fromJson(Map<String, dynamic> json) =>
      BookCategoryIsHomeDisplayed(
        cate: json["cate"] == null
            ? null
            : BookCategoryIsHomeDisplayedCate.fromJson(json["cate"]),
        books: json["books"] == null
            ? null
            : List<BookHome>.from(
                json["books"].map((x) => BookHome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cate": cate == null ? null : cate!.toJson(),
        "books": books == null
            ? null
            : List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}

class BookHome {
  BookHome({
    this.cover,
    this.tableOfContentImage,
    this.freePdf,
    this.background,
    this.id,
    this.title,
    this.slug,
    this.ownerId,
    this.briefDescription,
    this.description,
    this.isFree,
    this.isAllowTrial,
    this.status,
    this.orderId,
    this.tableOfContentIsPicture,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.ratingAvg,
    this.totalBuyer,
    this.totalCountRating,
    this.isAlreadyPurchased,
    this.authors,
    this.specifyCategories,
    this.purchasePackages,
    this.categories,
    this.owner,
  });

  String? cover;
  String? tableOfContentImage;
  String? freePdf;
  String? background;
  int? id;
  String? title;
  String? slug;
  String? ownerId;
  String? briefDescription;
  String? description;
  bool? isFree;
  bool? isAllowTrial;
  String? status;
  int? orderId;
  bool? tableOfContentIsPicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? ratingAvg;
  int? totalBuyer;
  int? totalCountRating;
  int? isAlreadyPurchased;
  List<Author>? authors;
  List<SpecifyCategory>? specifyCategories;
  List<PurchasePackageHome>? purchasePackages;
  List<Category>? categories;
  BookOwner? owner;

  factory BookHome.fromJson(Map<String, dynamic> json) => BookHome(
        cover: json["cover"] == null ? null : json["cover"],
        tableOfContentImage: json["tableOfContentImage"] == null
            ? null
            : json["tableOfContentImage"],
        freePdf: json["freePdf"] == null ? null : json["freePdf"],
        background: json["background"] == null ? null : json["background"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        ownerId: json["ownerId"] == null ? null : json["ownerId"],
        briefDescription:
            json["briefDescription"] == null ? null : json["briefDescription"],
        description: json["description"] == null ? null : json["description"],
        isFree: json["isFree"] == null ? null : json["isFree"],
        isAllowTrial:
            json["isAllowTrial"] == null ? null : json["isAllowTrial"],
        status: json["status"] == null ? null : json["status"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        tableOfContentIsPicture: json["tableOfContentIsPicture"] == null
            ? null
            : json["tableOfContentIsPicture"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        ratingAvg: json["ratingAvg"] == null ? null : json["ratingAvg"],
        totalBuyer: json["totalBuyer"] == null ? null : json["totalBuyer"],
        totalCountRating:
            json["totalCountRating"] == null ? null : json["totalCountRating"],
        isAlreadyPurchased: json["isAlreadyPurchased"] == null
            ? null
            : json["isAlreadyPurchased"],
        authors: json["authors"] == null
            ? null
            : List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        specifyCategories: json["specifyCategories"] == null
            ? null
            : List<SpecifyCategory>.from(json["specifyCategories"]
                .map((x) => SpecifyCategory.fromJson(x))),
        purchasePackages: json["purchasePackages"] == null
            ? null
            : List<PurchasePackageHome>.from(json["purchasePackages"]
                .map((x) => PurchasePackageHome.fromJson(x))),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        owner: json["owner"] == null ? null : BookOwner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "cover": cover == null ? null : cover,
        "tableOfContentImage":
            tableOfContentImage == null ? null : tableOfContentImage,
        "freePdf": freePdf == null ? null : freePdf,
        "background": background == null ? null : background,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "ownerId": ownerId == null ? null : ownerId,
        "briefDescription": briefDescription == null ? null : briefDescription,
        "description": description == null ? null : description,
        "isFree": isFree == null ? null : isFree,
        "isAllowTrial": isAllowTrial == null ? null : isAllowTrial,
        "status": status == null ? null : status,
        "orderId": orderId == null ? null : orderId,
        "tableOfContentIsPicture":
            tableOfContentIsPicture == null ? null : tableOfContentIsPicture,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "ratingAvg": ratingAvg == null ? null : ratingAvg,
        "totalBuyer": totalBuyer == null ? null : totalBuyer,
        "totalCountRating": totalCountRating == null ? null : totalCountRating,
        "isAlreadyPurchased":
            isAlreadyPurchased == null ? null : isAlreadyPurchased,
        "authors": authors == null
            ? null
            : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "specifyCategories": specifyCategories == null
            ? null
            : List<dynamic>.from(specifyCategories!.map((x) => x.toJson())),
        "purchasePackages": purchasePackages == null
            ? null
            : List<dynamic>.from(purchasePackages!.map((x) => x.toJson())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "owner": owner == null ? null : owner!.toJson(),
      };
}

class Author {
  Author({
    this.avatar,
    this.id,
    this.name,
    this.workPlace,
    this.profession,
    this.description,
    this.updatedAt,
    this.createdAt,
    this.bookAuthorModel,
  });

  String? avatar;
  int? id;
  String? name;
  String? workPlace;
  String? profession;
  String? description;
  DateTime? updatedAt;
  DateTime? createdAt;
  BookModel? bookAuthorModel;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        avatar: json["avatar"] == null ? null : json["avatar"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        workPlace: json["workPlace"] == null ? null : json["workPlace"],
        profession: json["profession"] == null ? null : json["profession"],
        description: json["description"] == null ? null : json["description"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        bookAuthorModel: json["BookAuthorModel"] == null
            ? null
            : BookModel.fromJson(json["BookAuthorModel"]),
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? null : avatar,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "workPlace": workPlace == null ? null : workPlace,
        "profession": profession == null ? null : profession,
        "description": description == null ? null : description,
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "BookAuthorModel":
            bookAuthorModel == null ? null : bookAuthorModel!.toJson(),
      };
}

class BookModel {
  BookModel({
    this.id,
    this.bookId,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.specifyCategoryId,
  });

  int? id;
  int? bookId;
  int? authorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? categoryId;
  int? specifyCategoryId;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"] == null ? null : json["id"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        authorId: json["authorId"] == null ? null : json["authorId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        specifyCategoryId: json["specifyCategoryId"] == null
            ? null
            : json["specifyCategoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "bookId": bookId == null ? null : bookId,
        "authorId": authorId == null ? null : authorId,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "categoryId": categoryId == null ? null : categoryId,
        "specifyCategoryId":
            specifyCategoryId == null ? null : specifyCategoryId,
      };
}

class Category {
  Category({
    this.name,
    this.id,
    this.bookCategoryModel,
  });

  String? name;
  int? id;
  BookModel? bookCategoryModel;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        bookCategoryModel: json["BookCategoryModel"] == null
            ? null
            : BookModel.fromJson(json["BookCategoryModel"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "BookCategoryModel":
            bookCategoryModel == null ? null : bookCategoryModel!.toJson(),
      };
}

class BookOwner {
  BookOwner({
    this.firstName,
    this.attributes,
    this.email,
  });

  String? firstName;
  PurpleAttributes? attributes;
  String? email;

  factory BookOwner.fromJson(Map<String, dynamic> json) => BookOwner(
        firstName: json["first_name"] == null ? null : json["first_name"],
        attributes: json["attributes"] == null
            ? null
            : PurpleAttributes.fromJson(json["attributes"]),
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null ? null : firstName,
        "attributes": attributes == null ? null : attributes!.toJson(),
        "email": email == null ? null : email,
      };
}

class PurpleAttributes {
  PurpleAttributes({
    this.isLocked,
    this.idAccount,
    this.dateOfBirth,
    this.registerVerificationToken,
    this.introduce,
    this.sex,
    this.introduceVideo,
    this.avatar,
    this.activedAt,
  });

  int? isLocked;
  String? idAccount;
  dynamic dateOfBirth;
  String? registerVerificationToken;
  String? introduce;
  dynamic sex;
  String? introduceVideo;
  String? avatar;
  dynamic activedAt;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        isLocked: json["is_locked"] == null ? null : json["is_locked"],
        idAccount: json["id_account"] == null ? null : json["id_account"],
        dateOfBirth: json["date_of_birth"],
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        introduce: json["introduce"] == null ? null : json["introduce"],
        sex: json["sex"],
        introduceVideo:
            json["introduce_video"] == null ? null : json["introduce_video"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        activedAt: json["actived_at"],
      );

  Map<String, dynamic> toJson() => {
        "is_locked": isLocked == null ? null : isLocked,
        "id_account": idAccount == null ? null : idAccount,
        "date_of_birth": dateOfBirth,
        "register_verification_token": registerVerificationToken == null
            ? null
            : registerVerificationToken,
        "introduce": introduce == null ? null : introduce,
        "sex": sex,
        "introduce_video": introduceVideo == null ? null : introduceVideo,
        "avatar": avatar == null ? null : avatar,
        "actived_at": activedAt,
      };
}

class PurchasePackageHome {
  PurchasePackageHome({
    this.id,
    this.bookId,
    this.duration,
    this.retailPrice,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? bookId;
  int? duration;
  int? retailPrice;
  int? discountPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;

  factory PurchasePackageHome.fromJson(Map<String, dynamic> json) =>
      PurchasePackageHome(
        id: json["id"] == null ? null : json["id"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        duration: json["duration"] == null ? null : json["duration"],
        retailPrice: json["retailPrice"] == null ? null : json["retailPrice"],
        discountPrice:
            json["discountPrice"] == null ? null : json["discountPrice"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "bookId": bookId == null ? null : bookId,
        "duration": duration == null ? null : duration,
        "retailPrice": retailPrice == null ? null : retailPrice,
        "discountPrice": discountPrice == null ? null : discountPrice,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class SpecifyCategory {
  SpecifyCategory({
    this.name,
    this.id,
    this.bookSpecifyCategoryModel,
  });

  String? name;
  int? id;
  BookModel? bookSpecifyCategoryModel;

  factory SpecifyCategory.fromJson(Map<String, dynamic> json) =>
      SpecifyCategory(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        bookSpecifyCategoryModel: json["BookSpecifyCategoryModel"] == null
            ? null
            : BookModel.fromJson(json["BookSpecifyCategoryModel"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "BookSpecifyCategoryModel": bookSpecifyCategoryModel == null
            ? null
            : bookSpecifyCategoryModel!.toJson(),
      };
}

class BookCategoryIsHomeDisplayedCate {
  BookCategoryIsHomeDisplayedCate({
    this.name,
  });

  String? name;

  factory BookCategoryIsHomeDisplayedCate.fromJson(Map<String, dynamic> json) =>
      BookCategoryIsHomeDisplayedCate(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}

class BookSubject {
  BookSubject({
    this.cate,
    this.bookSpecifyCategoryAttributes,
    this.bookRating,
  });

  BookSubjectCate? cate;
  List<BookHome>? bookSpecifyCategoryAttributes;
  List<BookHome>? bookRating;

  factory BookSubject.fromJson(Map<String, dynamic> json) => BookSubject(
        cate: json["cate"] == null
            ? null
            : BookSubjectCate.fromJson(json["cate"]),
        bookSpecifyCategoryAttributes:
            json["bookSpecifyCategoryAttributes"] == null
                ? []
                : List<BookHome>.from(json["bookSpecifyCategoryAttributes"]
                    .map((x) => BookHome.fromJson(x))),
        bookRating: json["bookRating"] == null
            ? null
            : List<BookHome>.from(
                json["bookRating"].map((x) => BookHome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cate": cate == null ? null : cate!.toJson(),
        "bookSpecifyCategoryAttributes": bookSpecifyCategoryAttributes == null
            ? null
            : List<dynamic>.from(
                bookSpecifyCategoryAttributes!.map((x) => x.toJson())),
        "bookRating": bookRating == null
            ? null
            : List<dynamic>.from(bookRating!.map((x) => x.toJson())),
      };
}

class BookSubjectCate {
  BookSubjectCate({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.isHomeDisplayed,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  String? type;
  bool? isHomeDisplayed;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory BookSubjectCate.fromJson(Map<String, dynamic> json) =>
      BookSubjectCate(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        type: json["type"] == null ? null : json["type"],
        isHomeDisplayed:
            json["isHomeDisplayed"] == null ? null : json["isHomeDisplayed"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "type": type == null ? null : type,
        "isHomeDisplayed": isHomeDisplayed == null ? null : isHomeDisplayed,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
