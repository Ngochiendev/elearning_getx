// To parse this JSON data, do
//
//     final ratingBookModel = ratingBookModelFromJson(jsonString);

import 'dart:convert';

RatingBookModel ratingBookModelFromJson(String str) => RatingBookModel.fromJson(json.decode(str));

String ratingBookModelToJson(RatingBookModel data) => json.encode(data.toJson());

class RatingBookModel {
    RatingBookModel({
    this.message,
    this.data,
  });

  String? message;
  DataRating? data;

  factory RatingBookModel.fromJson(Map<String, dynamic> json) => RatingBookModel(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : DataRating.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class DataRating {
  DataRating({
    this.ratings,
    this.pagination,
  });

  List<Rating>? ratings;
  Pagination? pagination;

  factory DataRating.fromJson(Map<String, dynamic> json) => DataRating(
    ratings: json["ratings"] == null ? null : List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "ratings": ratings == null ? null : List<dynamic>.from(ratings!.map((x) => x.toJson())),
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

class Rating {
  Rating({
    this.id,
    this.bookId,
    this.userId,
    this.rating,
    this.content,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  int? bookId;
  String? userId;
  int? rating;
  String? content;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["id"] == null ? null : json["id"],
    bookId: json["bookId"] == null ? null : json["bookId"],
    userId: json["userId"] == null ? null : json["userId"],
    rating: json["rating"] == null ? null : json["rating"],
    content: json["content"] == null ? null : json["content"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "bookId": bookId == null ? null : bookId,
    "userId": userId == null ? null : userId,
    "rating": rating == null ? null : rating,
    "content": content == null ? null : content,
    "status": status == null ? null : status,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "user": user == null ? null : user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.merchantCode,
    this.username,
    this.firstName,
    this.lastName,
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
  String? lastName;
  String? email;
  String? attributeSetId;
  List<Role>? roles;
  Attributes? attributes;
  double? createAt;
  double? updateAt;
  bool? active;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    merchantCode: json["merchant_code"] == null ? null : json["merchant_code"],
    username: json["username"] == null ? null : json["username"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    email: json["email"] == null ? null : json["email"],
    attributeSetId: json["attribute_set_id"] == null ? null : json["attribute_set_id"],
    roles: json["roles"] == null ? null : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
    createAt: json["create_at"] == null ? null : json["create_at"].toDouble(),
    updateAt: json["update_at"] == null ? null : json["update_at"].toDouble(),
    active: json["active"] == null ? null : json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "merchant_code": merchantCode == null ? null : merchantCode,
    "username": username == null ? null : username,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "email": email == null ? null : email,
    "attribute_set_id": attributeSetId == null ? null : attributeSetId,
    "roles": roles == null ? null : List<dynamic>.from(roles!.map((x) => x.toJson())),
    "attributes": attributes == null ? null : attributes!.toJson(),
    "create_at": createAt == null ? null : createAt,
    "update_at": updateAt == null ? null : updateAt,
    "active": active == null ? null : active,
  };
}

class Attributes {
  Attributes({
    this.parentEmail,
    this.province,
    this.school,
    this.phone,
    this.provinceId,
    this.dateOfBirth,
    this.registerVerificationToken,
    this.forgotPasswordExpireAt,
    this.sex,
    this.forgotPasswordToken,
    this.attributesClass,
    this.activedAt,
  });

  String? parentEmail;
  String? province;
  String? school;
  String? phone;
  String? provinceId;
  int? dateOfBirth;
  String? registerVerificationToken;
  String? forgotPasswordExpireAt;
  int? sex;
  String? forgotPasswordToken;
  String? attributesClass;
  String? activedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    parentEmail: json["parent_email"] == null ? null : json["parent_email"],
    province: json["province"] == null ? null : json["province"],
    school: json["school"] == null ? null : json["school"],
    phone: json["phone"] == null ? null : json["phone"],
    provinceId: json["province_id"] == null ? null : json["province_id"],
    // dateOfBirth: json["date_of_birth"] == null ? null : json["date_of_birth"],
    registerVerificationToken: json["register_verification_token"] == null ? null : json["register_verification_token"],
    forgotPasswordExpireAt: json["forgot_password_expire_at"] == null ? null : json["forgot_password_expire_at"],
    // sex: json["sex"] == null ? null : json["sex"],
    forgotPasswordToken: json["forgot_password_token"] == null ? null : json["forgot_password_token"],
    attributesClass: json["class"] == null ? null : json["class"],
    activedAt: json["actived_at"] == null ? null : json["actived_at"],
  );

  Map<String, dynamic> toJson() => {
    "parent_email": parentEmail == null ? null : parentEmail,
    "province": province == null ? null : province,
    "school": school == null ? null : school,
    "phone": phone == null ? null : phone,
    "province_id": provinceId == null ? null : provinceId,
    "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
    "register_verification_token": registerVerificationToken == null ? null : registerVerificationToken,
    "forgot_password_expire_at": forgotPasswordExpireAt == null ? null : forgotPasswordExpireAt,
    "sex": sex == null ? null : sex,
    "forgot_password_token": forgotPasswordToken == null ? null : forgotPasswordToken,
    "class": attributesClass == null ? null : attributesClass,
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
    merchantCode: json["merchant_code"] == null ? null : json["merchant_code"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "merchant_code": merchantCode == null ? null : merchantCode,
    "name": name == null ? null : name,
  };
}
