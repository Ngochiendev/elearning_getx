// To parse this JSON data, do
//
//     final couresProgress = couresProgressFromJson(jsonString);

import 'dart:convert';

CouresProgress couresProgressFromJson(String str) =>
    CouresProgress.fromJson(json.decode(str));

String couresProgressToJson(CouresProgress data) => json.encode(data.toJson());

class CouresProgress {
  CouresProgress({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory CouresProgress.fromJson(Map<String, dynamic> json) => CouresProgress(
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
    this.introVideo,
    this.avatar,
    this.id,
    this.gradeId,
    this.teacherId,
    this.title,
    this.slug,
    this.partnerUnit,
    this.briefDescription,
    this.description,
    this.benefit,
    this.requirement,
    this.status,
    this.defaultExerciseId,
    this.isFree,
    this.isHighlight,
    this.purchaseCount,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.totalSessionVideos,
    this.totalExercises,
    this.totalProgress,
    this.currentSessionId,
    this.userCourses,
    this.teacher,
    this.sessionExercise,
    this.ratingAvg,
  });

  String? introVideo;
  String? avatar;
  int? id;
  int? gradeId;
  String? teacherId;
  String? title;
  String? slug;
  String? partnerUnit;
  String? briefDescription;
  String? description;
  String? benefit;
  String? requirement;
  String? status;
  int? defaultExerciseId;
  bool? isFree;
  bool? isHighlight;
  int? purchaseCount;
  bool? isHidden;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? totalSessionVideos;
  int? totalExercises;
  int? totalProgress;
  int? currentSessionId;
  List<UserCourse>? userCourses;
  Teacher? teacher;
  List<SessionExercise>? sessionExercise;
  int? ratingAvg;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        introVideo: json["introVideo"] == null ? null : json["introVideo"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        id: json["id"] == null ? null : json["id"],
        gradeId: json["gradeId"] == null ? null : json["gradeId"],
        teacherId: json["teacherId"] == null ? null : json["teacherId"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        partnerUnit: json["partnerUnit"] == null ? null : json["partnerUnit"],
        briefDescription:
            json["briefDescription"] == null ? null : json["briefDescription"],
        description: json["description"] == null ? null : json["description"],
        benefit: json["benefit"] == null ? null : json["benefit"],
        requirement: json["requirement"] == null ? null : json["requirement"],
        status: json["status"] == null ? null : json["status"],
        defaultExerciseId: json["defaultExerciseId"] == null
            ? null
            : json["defaultExerciseId"],
        isFree: json["isFree"] == null ? null : json["isFree"],
        isHighlight: json["isHighlight"] == null ? null : json["isHighlight"],
        purchaseCount:
            json["purchaseCount"] == null ? null : json["purchaseCount"],
        isHidden: json["isHidden"] == null ? null : json["isHidden"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        totalSessionVideos:
            json["totalSessionVideos"] == null ? 0 : json["totalSessionVideos"],
        totalExercises:
            json["totalExercises"] == null ? 0 : json["totalExercises"],
        totalProgress:
            json["totalProgress"] == null ? 0 : json["totalProgress"],
        currentSessionId:
            json["currentSessionId"] == null ? null : json["currentSessionId"],
        userCourses: json["userCourses"] == null
            ? null
            : List<UserCourse>.from(
                json["userCourses"].map((x) => UserCourse.fromJson(x))),
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
        sessionExercise: json["sessionExercise"] == null
            ? null
            : List<SessionExercise>.from(json["sessionExercise"]
                .map((x) => SessionExercise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "introVideo": introVideo == null ? null : introVideo,
        "avatar": avatar == null ? null : avatar,
        "id": id == null ? null : id,
        "gradeId": gradeId == null ? null : gradeId,
        "teacherId": teacherId == null ? null : teacherId,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "partnerUnit": partnerUnit == null ? null : partnerUnit,
        "briefDescription": briefDescription == null ? null : briefDescription,
        "description": description == null ? null : description,
        "benefit": benefit == null ? null : benefit,
        "requirement": requirement == null ? null : requirement,
        "status": status == null ? null : status,
        "defaultExerciseId":
            defaultExerciseId == null ? null : defaultExerciseId,
        "isFree": isFree == null ? null : isFree,
        "isHighlight": isHighlight == null ? null : isHighlight,
        "purchaseCount": purchaseCount == null ? null : purchaseCount,
        "isHidden": isHidden == null ? null : isHidden,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "totalSessionVideos":
            totalSessionVideos == null ? null : totalSessionVideos,
        "totalExercises": totalExercises == null ? null : totalExercises,
        "totalProgress": totalProgress == null ? null : totalProgress,
        "currentSessionId": currentSessionId == null ? null : currentSessionId,
        "userCourses": userCourses == null
            ? null
            : List<dynamic>.from(userCourses!.map((x) => x.toJson())),
        "teacher": teacher == null ? null : teacher!.toJson(),
      };
}

class SessionExercise {
  SessionExercise({
    this.id,
    this.chapterId,
    this.title,
    this.description,
    this.orderId,
    this.exerciseId,
    this.isAllowTrial,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final int? id;
  final int? chapterId;
  final String? title;
  final dynamic description;
  final int? orderId;
  final int? exerciseId;
  final bool? isAllowTrial;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory SessionExercise.fromJson(Map<String, dynamic> json) =>
      SessionExercise(
        id: json["id"] == null ? null : json["id"],
        chapterId: json["chapterId"] == null ? null : json["chapterId"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
        isAllowTrial:
            json["isAllowTrial"] == null ? null : json["isAllowTrial"],
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
        "chapterId": chapterId == null ? null : chapterId,
        "title": title == null ? null : title,
        "description": description,
        "orderId": orderId == null ? null : orderId,
        "exerciseId": exerciseId == null ? null : exerciseId,
        "isAllowTrial": isAllowTrial == null ? null : isAllowTrial,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Teacher {
  Teacher({
    this.firstName,
    this.attributes,
    this.email,
  });

  String? firstName;
  Attributes? attributes;
  String? email;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
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
        // dateOfBirth:
        //     json["date_of_birth"] == null ? null : json["date_of_birth"],
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        introduce: json["introduce"] == null ? null : json["introduce"],
        // sex: json["sex"] == null ? null : json["sex"],
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

class UserCourse {
  UserCourse({
    this.activeAt,
    this.expireAt,
  });

  DateTime? activeAt;
  DateTime? expireAt;

  factory UserCourse.fromJson(Map<String, dynamic> json) => UserCourse(
        activeAt: json["activeAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["activeAt"]),
        expireAt: json["expireAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["expireAt"]),
      );

  Map<String, dynamic> toJson() => {
        "activeAt": activeAt == null ? null : activeAt!.toIso8601String(),
        "expireAt": expireAt == null ? null : expireAt!.toIso8601String(),
      };
}
