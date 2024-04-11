// To parse this JSON data, do
//
//     final newsTopTrend = newsTopTrendFromJson(jsonString);

import 'dart:convert';

BookProgress newsTopTrendFromJson(String str) =>
    BookProgress.fromJson(json.decode(str));

String newsTopTrendToJson(BookProgress data) => json.encode(data.toJson());

class BookProgress {
  BookProgress({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory BookProgress.fromJson(Map<String, dynamic> json) => BookProgress(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.bookId,
    this.activeAt,
    this.expireAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pageCurrentProgress,
    this.totalPages,
    this.totalProgress,
    this.datumBookExercises,
    this.ratingAvg,
    this.totalCountRating,
    this.book,
    this.owner,
    this.bookSpecifyCates,
    this.bookExercises,
  });

  int? id;
  String? userId;
  int? bookId;
  DateTime? activeAt;
  DateTime? expireAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic pageCurrentProgress;
  int? totalPages;
  int? totalProgress;
  int? datumBookExercises;
  int? ratingAvg;
  int? totalCountRating;
  Book? book;
  Owner? owner;
  List<dynamic>? bookSpecifyCates;
  List<BookExercise>? bookExercises;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        activeAt:
            json["activeAt"] == null ? null : DateTime.parse(json["activeAt"]),
        expireAt:
            json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        pageCurrentProgress: json["pageCurrentProgress"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        totalProgress:
            json["totalProgress"] == null ? null : json["totalProgress"],
        datumBookExercises:
            json["book_exercises"] == null ? null : json["book_exercises"],
        ratingAvg: json["ratingAvg"] == null ? 0 : json["ratingAvg"],
        totalCountRating:
            json["totalCountRating"] == null ? null : json["totalCountRating"],
        book: json["book"] == null ? null : Book.fromJson(json["book"]),
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        bookSpecifyCates: json["bookSpecifyCates"] == null
            ? null
            : List<dynamic>.from(json["bookSpecifyCates"].map((x) => x)),
        bookExercises: json["bookExercises"] == null
            ? null
            : List<BookExercise>.from(
                json["bookExercises"].map((x) => BookExercise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "bookId": bookId == null ? null : bookId,
        "activeAt": activeAt == null ? null : activeAt!.toIso8601String(),
        "expireAt": expireAt == null ? null : expireAt!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "pageCurrentProgress": pageCurrentProgress,
        "totalPages": totalPages == null ? null : totalPages,
        "totalProgress": totalProgress == null ? null : totalProgress,
        "book_exercises":
            datumBookExercises == null ? null : datumBookExercises,
        "ratingAvg": ratingAvg,
        "totalCountRating": totalCountRating == null ? null : totalCountRating,
        "book": book == null ? null : book!.toJson(),
        "owner": owner == null ? null : owner!.toJson(),
        "bookSpecifyCates": bookSpecifyCates == null
            ? null
            : List<dynamic>.from(bookSpecifyCates!.map((x) => x)),
        "bookExercises": bookExercises == null
            ? null
            : List<dynamic>.from(bookExercises!.map((x) => x.toJson())),
      };
}

class Book {
  Book({
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

  factory Book.fromJson(Map<String, dynamic> json) => Book(
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
      };
}

class BookExercise {
  BookExercise({
    this.id,
    this.bookId,
    this.exerciseId,
    this.pageFrom,
    this.pageTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? bookId;
  int? exerciseId;
  int? pageFrom;
  int? pageTo;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory BookExercise.fromJson(Map<String, dynamic> json) => BookExercise(
        id: json["id"] == null ? null : json["id"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
        pageFrom: json["pageFrom"] == null ? null : json["pageFrom"],
        pageTo: json["pageTo"] == null ? null : json["pageTo"],
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
        "exerciseId": exerciseId == null ? null : exerciseId,
        "pageFrom": pageFrom == null ? null : pageFrom,
        "pageTo": pageTo == null ? null : pageTo,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Owner {
  Owner({
    this.firstName,
    this.attributes,
    this.email,
  });

  String? firstName;
  Attributes? attributes;
  String? email;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        firstName: json["first_name"] == null ? null : json["first_name"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null ? null : firstName,
        "attributes": attributes == null ? null : attributes!.toJson(),
        "email": email == null ? null : email,
      };
}

class Attributes {
  Attributes({
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
  String? dateOfBirth;
  String? registerVerificationToken;
  String? introduce;
  String? sex;
  String? introduceVideo;
  String? avatar;
  String? activedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        isLocked: json["is_locked"] == null ? null : json["is_locked"],
        idAccount: json["id_account"] == null ? null : json["id_account"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : json["date_of_birth"].toString(),
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        introduce: json["introduce"] == null ? null : json["introduce"],
        sex: json["sex"] == null ? null : json["sex"].toString(),
        introduceVideo:
            json["introduce_video"] == null ? null : json["introduce_video"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        activedAt: json["actived_at"] == null ? null : json["actived_at"],
      );

  Map<String, dynamic> toJson() => {
        "is_locked": isLocked == null ? null : isLocked,
        "id_account": idAccount == null ? null : idAccount,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "register_verification_token": registerVerificationToken == null
            ? null
            : registerVerificationToken,
        "introduce": introduce == null ? null : introduce,
        "sex": sex == null ? null : sex,
        "introduce_video": introduceVideo == null ? null : introduceVideo,
        "avatar": avatar == null ? null : avatar,
        "actived_at": activedAt == null ? null : activedAt,
      };
}
