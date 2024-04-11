// To parse this JSON data, do
//
//     final homeexam = homeexamFromJson(jsonString);

import 'dart:convert';

Homeexam homeexamFromJson(String str) => Homeexam.fromJson(json.decode(str));

String homeexamToJson(Homeexam data) => json.encode(data.toJson());

class Homeexam {
  Homeexam({
    this.message,
    this.data,
  });

  String? message;
  DataExam? data;

  factory Homeexam.fromJson(Map<String, dynamic> json) => Homeexam(
        message: json["message"],
        data: DataExam.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class DataExam {
  DataExam({
    this.banners,
    this.happeningExams,
    this.willHappenExams,
  });

  Banners? banners;
  List<HappeningExam>? happeningExams;
  List<WillHappenExam>? willHappenExams;

  factory DataExam.fromJson(Map<String, dynamic> json) => DataExam(
        banners: Banners.fromJson(json["banners"]),
        happeningExams: List<HappeningExam>.from(json["happeningExams"].map((x) => HappeningExam.fromJson(x))),
        willHappenExams: List<WillHappenExam>.from(json["willHappenExams"].map((x) => WillHappenExam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": banners!.toJson(),
        "happeningExams": List<dynamic>.from(happeningExams!.map((x) => x.toJson())),
        "willHappenExams": List<dynamic>.from(willHappenExams!.map((x) => x.toJson())),
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
            : List<AppBanner>.from(json["topBanners"].map((x) => AppBanner.fromJson(x))),
        middleBanners: json["middleBanners"] == null
            ? null
            : List<AppBanner>.from(json["middleBanners"].map((x) => AppBanner.fromJson(x))),
        appBanners: json["appBanners"] == null
            ? null
            : List<AppBanner>.from(json["appBanners"].map((x) => AppBanner.fromJson(x))),
        appSlides: json["appSlides"] == null
            ? null
            : List<AppBanner>.from(json["appSlides"].map((x) => AppBanner.fromJson(x))),
        leftBanner: json["leftBanner"] == null
            ? null
            : List<AppBanner>.from(json["leftBanner"].map((x) => AppBanner.fromJson(x))),
        rightBanner: json["rightBanner"] == null
            ? null
            : List<AppBanner>.from(json["rightBanner"].map((x) => AppBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topBanners": topBanners == null ? null : List<dynamic>.from(topBanners!.map((x) => x.toJson())),
        "middleBanners": middleBanners == null ? null : List<dynamic>.from(middleBanners!.map((x) => x.toJson())),
        "appBanners": appBanners == null ? null : List<dynamic>.from(appBanners!.map((x) => x.toJson())),
        "appSlides": appSlides == null ? null : List<dynamic>.from(appSlides!.map((x) => x.toJson())),
        "leftBanner": leftBanner == null ? null : List<dynamic>.from(leftBanner!.map((x) => x.toJson())),
        "rightBanner": rightBanner == null ? null : List<dynamic>.from(rightBanner!.map((x) => x.toJson())),
      };
}

class TopBanner {
  TopBanner({
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

  factory TopBanner.fromJson(Map<String, dynamic> json) => TopBanner(
        source: json["source"],
        id: json["id"],
        title: json["title"],
        linkDirect: json["linkDirect"],
        position: json["position"],
        orderId: json["orderId"],
        isActive: json["isActive"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "id": id,
        "title": title,
        "linkDirect": linkDirect,
        "position": position,
        "orderId": orderId,
        "isActive": isActive,
        "type": type,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

class HappeningExam {
  HappeningExam({
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
  HappeningExamOwner? owner;

  factory HappeningExam.fromJson(Map<String, dynamic> json) => HappeningExam(
        introVideo: json["introVideo"],
        avatar: json["avatar"],
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
        owner: HappeningExamOwner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "introVideo": introVideo,
        "avatar": avatar,
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "activeAt": activeAt!.toIso8601String(),
        "expiredAt": expiredAt!.toIso8601String(),
        "totalQuestions": totalQuestions,
        "totalConfigQuestions": totalConfigQuestions,
        "purchasePackages": List<dynamic>.from(purchasePackages!.map((x) => x)),
        "exercise": exercise!.toJson(),
        "owner": owner!.toJson(),
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

class HappeningExamOwner {
  HappeningExamOwner({
    this.firstName,
    this.attributes,
    this.email,
  });

  String? firstName;
  PurpleAttributes? attributes;
  String? email;

  factory HappeningExamOwner.fromJson(Map<String, dynamic> json) => HappeningExamOwner(
        firstName: json["first_name"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "attributes": attributes!.toJson(),
        "email": email,
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
  int? dateOfBirth;
  String? registerVerificationToken;
  String? introduce;
  int? sex;
  String? introduceVideo;
  String? avatar;
  String? activedAt;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
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

class WillHappenExam {
  WillHappenExam({
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
  WillHappenExamOwner? owner;

  factory WillHappenExam.fromJson(Map<String, dynamic> json) => WillHappenExam(
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
        owner: WillHappenExamOwner.fromJson(json["owner"]),
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "activeAt": activeAt!.toIso8601String(),
        "expiredAt": expiredAt!.toIso8601String(),
        "totalQuestions": totalQuestions,
        "totalConfigQuestions": totalConfigQuestions,
        "purchasePackages": List<dynamic>.from(purchasePackages!.map((x) => x.toJson())),
        "exercise": exercise!.toJson(),
        "owner": owner!.toJson(),
      };
}

class WillHappenExamOwner {
  WillHappenExamOwner({
    this.firstName,
    this.attributes,
    this.email,
  });

  String? firstName;
  FluffyAttributes? attributes;
  String? email;

  factory WillHappenExamOwner.fromJson(Map<String, dynamic> json) => WillHappenExamOwner(
        firstName: json["first_name"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "attributes": attributes!.toJson(),
        "email": email,
      };
}

class FluffyAttributes {
  FluffyAttributes({
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
  dynamic activedAt;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
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
