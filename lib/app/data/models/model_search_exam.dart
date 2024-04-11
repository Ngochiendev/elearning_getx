// To parse this JSON data, do
//
//     final modelExam = modelExamFromJson(jsonString);

import 'dart:convert';

ModelExam modelExamFromJson(String str) => ModelExam.fromJson(json.decode(str));

String modelExamToJson(ModelExam data) => json.encode(data.toJson());

class ModelExam {
  ModelExam({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory ModelExam.fromJson(Map<String, dynamic> json) => ModelExam(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.exams,
    this.pagination,
  });

  List<Exam>? exams;
  Pagination? pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        exams: List<Exam>.from(json["exams"].map((x) => Exam.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "exams": List<dynamic>.from(exams!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
      };
}

class Exam {
  Exam({
    this.introVideo,
    this.avatar,
    this.id,
    this.ownerId,
    this.title,
    this.slug,
    this.briefDescription,
    this.description,
    this.benefit,
    this.requirement,
    this.status,
    this.exerciseId,
    this.isFree,
    this.isHighlight,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.activeAt,
    this.expiredAt,
    this.totalQuestions,
    this.totalConfigQuestions,
    this.purchasePackages,
    this.exercise,
    this.owner,
    this.happenStatus,
  });

  dynamic introVideo;
  String? avatar;
  int? id;
  String? ownerId;
  String? title;
  String? slug;
  String? briefDescription;
  String? description;
  String? benefit;
  String? requirement;
  String? status;
  int? exerciseId;
  bool? isFree;
  bool? isHighlight;
  bool? isHidden;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  DateTime? activeAt;
  DateTime? expiredAt;
  int? totalQuestions;
  dynamic totalConfigQuestions;
  List<PurchasePackage>? purchasePackages;
  Exercise? exercise;
  Owner? owner;
  String? happenStatus;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        introVideo: json["introVideo"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        id: json["id"],
        ownerId: json["ownerId"],
        title: json["title"],
        slug: json["slug"],
        briefDescription: json["briefDescription"],
        description: json["description"],
        benefit: json["benefit"],
        requirement: json["requirement"],
        status: json["status"],
        exerciseId: json["exerciseId"],
        isFree: json["isFree"],
        isHighlight: json["isHighlight"],
        isHidden: json["isHidden"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        activeAt: DateTime.parse(json["activeAt"]),
        expiredAt: DateTime.parse(json["expiredAt"]),
        totalQuestions: json["totalQuestions"],
        totalConfigQuestions: json["totalConfigQuestions"],
        purchasePackages: List<PurchasePackage>.from(json["purchasePackages"].map((x) => PurchasePackage.fromJson(x))),
        exercise: Exercise.fromJson(json["exercise"]),
        owner: Owner.fromJson(json["owner"]),
        happenStatus: json["happenStatus"],
      );

  Map<String, dynamic> toJson() => {
        "introVideo": introVideo,
        "avatar": avatar == null ? null : avatar,
        "id": id,
        "ownerId": ownerId,
        "title": title,
        "slug": slug,
        "briefDescription": briefDescription,
        "description": description,
        "benefit": benefit,
        "requirement": requirement,
        "status": status,
        "exerciseId": exerciseId,
        "isFree": isFree,
        "isHighlight": isHighlight,
        "isHidden": isHidden,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "activeAt": activeAt?.toIso8601String(),
        "expiredAt": expiredAt?.toIso8601String(),
        "totalQuestions": totalQuestions,
        "totalConfigQuestions": totalConfigQuestions,
        "purchasePackages": List<dynamic>.from(purchasePackages!.map((x) => x.toJson())),
        "exercise": exercise!.toJson(),
        "owner": owner!.toJson(),
        "happenStatus": happenStatus,
      };
}

class Exercise {
  Exercise({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.totalPoints,
    this.status,
    this.isShuffle,
    this.displayType,
    this.ownerAbleId,
    this.ownerAbleType,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? description;
  int? duration;
  int? totalPoints;
  String? status;
  bool? isShuffle;
  String? displayType;
  String? ownerAbleId;
  String? ownerAbleType;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        totalPoints: json["totalPoints"],
        status: json["status"],
        isShuffle: json["isShuffle"],
        displayType: json["displayType"],
        ownerAbleId: json["ownerAbleId"],
        ownerAbleType: json["ownerAbleType"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "duration": duration,
        "totalPoints": totalPoints,
        "status": status,
        "isShuffle": isShuffle,
        "displayType": displayType,
        "ownerAbleId": ownerAbleId,
        "ownerAbleType": ownerAbleType,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
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
        firstName: json["first_name"],
        attributes: Attributes.fromJson(json["attributes"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "attributes": attributes!.toJson(),
        "email": email,
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
  dynamic dateOfBirth;
  String? registerVerificationToken;
  String? introduce;
  dynamic sex;
  String? introduceVideo;
  String? avatar;
  dynamic activedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        isLocked: json["is_locked"],
        idAccount: json["id_account"],
        dateOfBirth: json["date_of_birth"],
        registerVerificationToken: json["register_verification_token"],
        introduce: json["introduce"],
        sex: json["sex"],
        introduceVideo: json["introduce_video"],
        avatar: json["avatar"],
        activedAt: json["actived_at"],
      );

  Map<String, dynamic> toJson() => {
        "is_locked": isLocked,
        "id_account": idAccount,
        "date_of_birth": dateOfBirth,
        "register_verification_token": registerVerificationToken,
        "introduce": introduce,
        "sex": sex,
        "introduce_video": introduceVideo,
        "avatar": avatar,
        "actived_at": activedAt,
      };
}

class PurchasePackage {
  PurchasePackage({
    this.id,
    this.purchasePackageExamId,
    this.quantity,
    this.retailPrice,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.examId,
  });

  int? id;
  int? purchasePackageExamId;
  int? quantity;
  int? retailPrice;
  int? discountPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? examId;

  factory PurchasePackage.fromJson(Map<String, dynamic> json) => PurchasePackage(
        id: json["id"],
        purchasePackageExamId: json["examId"],
        quantity: json["quantity"],
        retailPrice: json["retailPrice"],
        discountPrice: json["discountPrice"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        examId: json["ExamId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "examId": purchasePackageExamId,
        "quantity": quantity,
        "retailPrice": retailPrice,
        "discountPrice": discountPrice,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "ExamId": examId,
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
        total: json["total"],
        page: json["page"],
        perPage: json["perPage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "perPage": perPage,
      };
}
