// To parse this JSON data, do
//
//     final userCourseProgess = userCourseProgessFromJson(jsonString);

import 'dart:convert';

UserCourseProgess userCourseProgessFromJson(String str) =>
    UserCourseProgess.fromJson(json.decode(str));

String userCourseProgessToJson(UserCourseProgess data) =>
    json.encode(data.toJson());

class UserCourseProgess {
  UserCourseProgess({
    this.message,
    this.data,
  });

  String? message;
  DataProgess? data;

  factory UserCourseProgess.fromJson(Map<String, dynamic> json) =>
      UserCourseProgess(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataProgess.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataProgess {
  DataProgess({
    this.startCourse,
    this.inProgressCourse,
    this.doneCourse,
  });

  List<Course>? startCourse;
  List<Course>? inProgressCourse;
  List<Course>? doneCourse;

  factory DataProgess.fromJson(Map<String, dynamic> json) => DataProgess(
        startCourse: json["startCourse"] == null
            ? null
            : List<Course>.from(
                json["startCourse"].map((x) => Course.fromJson(x))),
        inProgressCourse: json["inProgressCourse"] == null
            ? null
            : List<Course>.from(
                json["inProgressCourse"].map((x) => Course.fromJson(x))),
        doneCourse: json["doneCourse"] == null
            ? null
            : List<Course>.from(
                json["doneCourse"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "startCourse": startCourse == null
            ? null
            : List<dynamic>.from(startCourse!.map((x) => x.toJson())),
        "inProgressCourse": inProgressCourse == null
            ? null
            : List<dynamic>.from(inProgressCourse!.map((x) => x.toJson())),
        "doneCourse": doneCourse == null
            ? null
            : List<dynamic>.from(doneCourse!.map((x) => x.toJson())),
      };
}

class Course {
  Course({
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
    this.progressPercentage,
    this.userCourses,
    this.teacher,
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
  dynamic? defaultExerciseId;
  bool? isFree;
  bool? isHighlight;
  int? purchaseCount;
  bool? isHidden;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  String? progressPercentage;
  List<UserCourse>? userCourses;
  Teacher? teacher;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
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
        defaultExerciseId: json["defaultExerciseId"],
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
        progressPercentage: json["progressPercentage"] == null
            ? null
            : json["progressPercentage"],
        userCourses: json["userCourses"] == null
            ? null
            : List<UserCourse>.from(
                json["userCourses"].map((x) => UserCourse.fromJson(x))),
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
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
        "defaultExerciseId": defaultExerciseId,
        "isFree": isFree == null ? null : isFree,
        "isHighlight": isHighlight == null ? null : isHighlight,
        "purchaseCount": purchaseCount == null ? null : purchaseCount,
        "isHidden": isHidden == null ? null : isHidden,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "progressPercentage":
            progressPercentage == null ? null : progressPercentage,
        "userCourses": userCourses == null
            ? null
            : List<dynamic>.from(userCourses!.map((x) => x.toJson())),
        "teacher": teacher == null ? null : teacher!.toJson(),
      };
}

class Teacher {
  Teacher({
    this.id,
    this.merchantCode,
    this.username,
    this.firstName,
    this.phone,
    this.email,
    this.attributeSetId,
    this.roles,
    this.attributes,
    this.createAt,
    this.updateAt,
    this.active,
  });

  String? id;
  String? merchantCode;
  String? username;
  String? firstName;
  String? phone;
  String? email;
  String? attributeSetId;
  List<Role>? roles;
  Attributes? attributes;
  double? createAt;
  double? updateAt;
  bool? active;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        username: json["username"] == null ? null : json["username"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        attributeSetId:
            json["attribute_set_id"] == null ? null : json["attribute_set_id"],
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        createAt:
            json["create_at"] == null ? null : json["create_at"].toDouble(),
        updateAt:
            json["update_at"] == null ? null : json["update_at"].toDouble(),
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "username": username == null ? null : username,
        "first_name": firstName == null ? null : firstName,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "attribute_set_id": attributeSetId == null ? null : attributeSetId,
        "roles": roles == null
            ? null
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "attributes": attributes == null ? null : attributes!.toJson(),
        "create_at": createAt == null ? null : createAt,
        "update_at": updateAt == null ? null : updateAt,
        "active": active == null ? null : active,
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
        // dateOfBirth: json["date_of_birth"] == null ? null : json["date_of_birth"],
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

class Role {
  Role({
    this.id,
    this.merchantCode,
    this.name,
  });

  String? id;
  String? merchantCode;
  String? name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "name": name == null ? null : name,
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
        activeAt:
            json["activeAt"] == null ? null : DateTime.parse(json["activeAt"]),
        expireAt:
            json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
      );

  Map<String, dynamic> toJson() => {
        "activeAt": activeAt == null ? null : activeAt!.toIso8601String(),
        "expireAt": expireAt == null ? null : expireAt!.toIso8601String(),
      };
}
