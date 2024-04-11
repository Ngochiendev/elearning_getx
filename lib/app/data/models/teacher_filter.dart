// To parse this JSON data, do
//
//     final teacherFillter = teacherFillterFromJson(jsonString);

import 'dart:convert';

TeacherFillter teacherFillterFromJson(String str) =>
    TeacherFillter.fromJson(json.decode(str));

String teacherFillterToJson(TeacherFillter data) => json.encode(data.toJson());

class TeacherFillter {
  TeacherFillter({
    this.message,
    this.data,
  });

  String? message;
  DataTeacher? data;

  factory TeacherFillter.fromJson(Map<String, dynamic> json) => TeacherFillter(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataTeacher.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataTeacher {
  DataTeacher({
    this.teacherPaginations,
    this.pagination,
  });

  List<TeacherPagination>? teacherPaginations;
  Pagination? pagination;

  factory DataTeacher.fromJson(Map<String, dynamic> json) => DataTeacher(
        teacherPaginations: json["teacherPaginations"] == null
            ? null
            : List<TeacherPagination>.from(json["teacherPaginations"]
                .map((x) => TeacherPagination.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "teacherPaginations": teacherPaginations == null
            ? null
            : List<dynamic>.from(teacherPaginations!.map((x) => x.toJson())),
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

class TeacherPagination {
  TeacherPagination({
    this.teacher,
    this.totalCourse,
    this.rating,
    this.totalRating,
    this.totalUser,
  });

  TeacherFill? teacher;
  int? totalCourse;
  int? rating;
  int? totalRating;
  int? totalUser;

  factory TeacherPagination.fromJson(Map<String, dynamic> json) =>
      TeacherPagination(
        teacher:
            json["teacher"] == null ? null : TeacherFill.fromJson(json["teacher"]),
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

class TeacherFill {
  TeacherFill({
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

  factory TeacherFill.fromJson(Map<String, dynamic> json) => TeacherFill(
        id: json["id"] == null ? null : json["id"],
        merchantCode: json["merchant_code"] == null
            ? null
            : json["merchant_code"],
        username: json["username"] == null ? null : json["username"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        attributeSetId: json["attribute_set_id"] == null
            ? null
            : json["attribute_set_id"],
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
        "merchant_code": merchantCode == null
            ? null
            : merchantCode,
        "username": username == null ? null : username,
        "first_name": firstName == null ? null : firstName,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "attribute_set_id": attributeSetId == null
            ? null
            : attributeSetId,
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
  dynamic dateOfBirth;
  String? registerVerificationToken;
  String? introduce;
  dynamic sex;
  String? introduceVideo;
  String? avatar;
  dynamic activedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        isLocked: json["is_locked"] == null ? null : json["is_locked"],
        idAccount: json["id_account"] == null ? null : json["id_account"],
        dateOfBirth: json["date_of_birth"],
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        introduce: json["introduce"] == null
            ? null
            : json["introduce"],
        sex: json["sex"],
        introduceVideo:
            json["introduce_video"] == null ? null : json["introduce_video"],
        avatar: json["avatar"] == null|| json["avatar"] == "" ? "" : json["avatar"],
        activedAt: json["actived_at"],
      );

  Map<String, dynamic> toJson() => {
        "is_locked": isLocked == null ? null : isLocked,
        "id_account": idAccount == null ? null : idAccount,
        "date_of_birth": dateOfBirth,
        "register_verification_token": registerVerificationToken == null
            ? null
            : registerVerificationToken,
        "introduce":
            introduce == null ? null : introduce,
        "sex": sex,
        "introduce_video": introduceVideo == null ? null : introduceVideo,
        "avatar": avatar == null ? null : avatar,
        "actived_at": activedAt,
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
        merchantCode: json["merchant_code"] == null
            ? null
            : json["merchant_code"],
        name: json["name"] == null ? null :json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null
            ? null
            : merchantCode,
        "name": name == null ? null : name,
      };
}


