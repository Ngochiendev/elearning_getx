// To parse this JSON data, do
//
//     final teacherDetail = teacherDetailFromJson(jsonString);

import 'dart:convert';

TeacherDetail teacherDetailFromJson(String str) =>
    TeacherDetail.fromJson(json.decode(str));

String teacherDetailToJson(TeacherDetail data) => json.encode(data.toJson());

class TeacherDetail {
  TeacherDetail({
    this.message,
    this.data,
  });

  String? message;
  DataDetailTeacher? data;

  factory TeacherDetail.fromJson(Map<String, dynamic> json) => TeacherDetail(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : DataDetailTeacher.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataDetailTeacher {
  DataDetailTeacher({
    this.teacher,
    this.courses,
  });

  DataTeacher? teacher;
  List<CourseDetailTeacher>? courses;

  factory DataDetailTeacher.fromJson(Map<String, dynamic> json) =>
      DataDetailTeacher(
        teacher: json["teacher"] == null
            ? null
            : DataTeacher.fromJson(json["teacher"]),
        courses: json["courses"] == null
            ? null
            : List<CourseDetailTeacher>.from(
                json["courses"].map((x) => CourseDetailTeacher.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teacher": teacher == null ? null : teacher!.toJson(),
        "courses": courses == null
            ? null
            : List<dynamic>.from(courses!.map((x) => x.toJson())),
      };
}

class CourseDetailTeacher {
  CourseDetailTeacher({
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
    this.isAllowTrial,
    this.totalSessions,
    this.totalVideos,
    this.retailPrice,
    this.discountPrice,
    this.price,
    this.discountPercentage,
    this.ratingAvg,
    this.totalRating,
    this.totalUserPurchase,
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
  dynamic defaultExerciseId;
  bool? isFree;
  bool? isHighlight;
  int? purchaseCount;
  bool? isHidden;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? isAllowTrial;
  int? totalSessions;
  int? totalVideos;
  int? retailPrice;
  int? discountPrice;
  int? price;
  int? discountPercentage;
  String? ratingAvg;
  int? totalRating;
  int? totalUserPurchase;
  CourseTeacher? teacher;

  factory CourseDetailTeacher.fromJson(Map<String, dynamic> json) =>
      CourseDetailTeacher(
        introVideo: json["introVideo"],
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
        isAllowTrial:
            json["isAllowTrial"] == null ? null : json["isAllowTrial"],
        totalSessions:
            json["totalSessions"] == null ? null : json["totalSessions"],
        totalVideos: json["totalVideos"] == null ? null : json["totalVideos"],
        retailPrice: json["retailPrice"] == null ? null : json["retailPrice"],
        discountPrice:
            json["discountPrice"] == null ? null : json["discountPrice"],
        price: json["price"] == null ? null : json["price"],
        discountPercentage: json["discountPercentage"] == null
            ? null
            : json["discountPercentage"],
        ratingAvg: json["ratingAvg"] == null ? null : json["ratingAvg"],
        totalRating: json["totalRating"] == null ? null : json["totalRating"],
        totalUserPurchase: json["totalUserPurchase"] == null
            ? null
            : json["totalUserPurchase"],
        teacher: json["teacher"] == null
            ? null
            : CourseTeacher.fromJson(json["teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "introVideo": introVideo,
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
        "isAllowTrial": isAllowTrial == null ? null : isAllowTrial,
        "totalSessions": totalSessions == null ? null : totalSessions,
        "totalVideos": totalVideos == null ? null : totalVideos,
        "retailPrice": retailPrice == null ? null : retailPrice,
        "discountPrice": discountPrice == null ? null : discountPrice,
        "price": price == null ? null : price,
        "discountPercentage":
            discountPercentage == null ? null : discountPercentage,
        "ratingAvg": ratingAvg == null ? null : ratingAvg,
        "totalRating": totalRating == null ? null : totalRating,
        "totalUserPurchase":
            totalUserPurchase == null ? null : totalUserPurchase,
        "teacher": teacher == null ? null : teacher!.toJson(),
      };
}

class CourseTeacher {
  CourseTeacher({
    this.firstName,
    this.attributes,
    this.email,
  });

  String? firstName;
  Attributes? attributes;
  String? email;

  factory CourseTeacher.fromJson(Map<String, dynamic> json) => CourseTeacher(
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
        avatar: json["avatar"] == null || json["avatar"] == ""
            ? ""
            : json["avatar"],
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

class DataTeacher {
  DataTeacher({
    this.teacher,
    this.totalCourse,
    this.rating,
    this.totalRating,
    this.totalUser,
  });

  TeacherTeacher? teacher;
  int? totalCourse;
  int? rating;
  int? totalRating;
  int? totalUser;

  factory DataTeacher.fromJson(Map<String, dynamic> json) => DataTeacher(
        teacher: json["teacher"] == null
            ? null
            : TeacherTeacher.fromJson(json["teacher"]),
        totalCourse: json["totalCourse"] == null ? null : json["totalCourse"],
        rating: json["rating"] == null ? null : json["rating"],
        totalRating: json["totalRating"] == null ? null : json["totalRating"],
        totalUser: json["totalUser"] == null ? null : json["totalUser"],
      );

  Map<String, dynamic> toJson() => {
        "teacher": teacher == null ? null : teacher!.toJson(),
        "totalCourse": totalCourse == null ? null : totalCourse,
        "rating": rating == null ? null : rating,
        "totalRating": totalRating == null ? null : totalRating,
        "totalUser": totalUser == null ? null : totalUser,
      };
}

class TeacherTeacher {
  TeacherTeacher({
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

  factory TeacherTeacher.fromJson(Map<String, dynamic> json) => TeacherTeacher(
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
