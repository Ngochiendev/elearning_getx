// To parse this JSON data, do
//
//     final commentSessionModel = commentSessionModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

CommentSessionModel commentSessionModelFromJson(String str) =>
    CommentSessionModel.fromJson(json.decode(str));

String commentSessionModelToJson(CommentSessionModel data) =>
    json.encode(data.toJson());

class CommentSessionModel {
  CommentSessionModel({
    this.message,
    this.data,
  });

  String? message;
  DataComment? data;

  factory CommentSessionModel.fromJson(Map<String, dynamic> json) =>
      CommentSessionModel(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataComment.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataComment {
  DataComment({
    this.comments,
  });

  List<Comment>? comments;

  factory DataComment.fromJson(Map<String, dynamic> json) => DataComment(
        comments: json["comments"] == null
            ? null
            : List<Comment>.from(
                json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.id,
    this.parentId,
    this.sessionId,
    this.commentableId,
    this.commentableType,
    this.content,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.totalReply,
    this.commentImages,
    this.commentable,
    this.children,
    this.showRepply = false,
    this.repplyCtrl,
    this.checkSendReppy = false,
  });

  int? id;
  dynamic parentId;
  int? sessionId;
  String? commentableId;
  String? commentableType;
  String? content;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalReply;
  List<CommentImage>? commentImages;
  CommentCommentable? commentable;
  List<Child>? children;
  bool? showRepply;
  TextEditingController? repplyCtrl = TextEditingController();
  bool? checkSendReppy;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"] == null ? null : json["id"],
        parentId: json["parentId"],
        sessionId: json["sessionId"] == null ? null : json["sessionId"],
        commentableId:
            json["commentableId"] == null ? null : json["commentableId"],
        commentableType:
            json["commentableType"] == null ? null : json["commentableType"],
        content: json["content"] == null ? null : json["content"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        totalReply: json["totalReply"] == null ? null : json["totalReply"],
        commentImages: json["commentImages"] == null
            ? null
            : List<CommentImage>.from(
                json["commentImages"].map((x) => CommentImage.fromJson(x))),
        commentable: json["commentable"] == null
            ? null
            : CommentCommentable.fromJson(json["commentable"]),
        children: json["children"] == null
            ? null
            : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parentId": parentId,
        "sessionId": sessionId == null ? null : sessionId,
        "commentableId": commentableId == null ? null : commentableId,
        "commentableType": commentableType == null ? null : commentableType,
        "content": content == null ? null : content,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "totalReply": totalReply == null ? null : totalReply,
        "commentImages": commentImages == null
            ? null
            : List<dynamic>.from(commentImages!.map((x) => x.toJson())),
        "commentable": commentable == null ? null : commentable!.toJson(),
        "children": children == null
            ? null
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class Child {
  Child({
    this.id,
    this.parentId,
    this.sessionId,
    this.commentableId,
    this.commentableType,
    this.content,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.totalReply,
    this.commentImages,
    this.commentable,
    this.children,
  });

  int? id;
  int? parentId;
  int? sessionId;
  String? commentableId;
  String? commentableType;
  String? content;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalReply;
  List<dynamic>? commentImages;
  ChildCommentable? commentable;
  List<dynamic>? children;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"] == null ? null : json["id"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        sessionId: json["sessionId"] == null ? null : json["sessionId"],
        commentableId:
            json["commentableId"] == null ? null : json["commentableId"],
        commentableType:
            json["commentableType"] == null ? null : json["commentableType"],
        content: json["content"] == null ? null : json["content"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        totalReply: json["totalReply"] == null ? null : json["totalReply"],
        commentImages: json["commentImages"] == null
            ? null
            : List<dynamic>.from(json["commentImages"].map((x) => x)),
        commentable: json["commentable"] == null
            ? null
            : ChildCommentable.fromJson(json["commentable"]),
        children: json["children"] == null
            ? null
            : List<dynamic>.from(json["children"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parentId": parentId == null ? null : parentId,
        "sessionId": sessionId == null ? null : sessionId,
        "commentableId": commentableId == null ? null : commentableId,
        "commentableType": commentableType == null ? null : commentableType,
        "content": content == null ? null : content,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "totalReply": totalReply == null ? null : totalReply,
        "commentImages": commentImages == null
            ? null
            : List<dynamic>.from(commentImages!.map((x) => x)),
        "commentable": commentable == null ? null : commentable!.toJson(),
        "children": children == null
            ? null
            : List<dynamic>.from(children!.map((x) => x)),
      };
}

class ChildCommentable {
  ChildCommentable({
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
    this.province,
    this.phone,
  });

  String? id;
  String? merchantCode;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? attributeSetId;
  List<Role>? roles;
  PurpleAttributes? attributes;
  int? createAt;
  int? updateAt;
  bool? active;
  Province? province;
  String? phone;

  factory ChildCommentable.fromJson(Map<String, dynamic> json) =>
      ChildCommentable(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        username: json["username"] == null ? null : json["username"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        attributeSetId:
            json["attribute_set_id"] == null ? null : json["attribute_set_id"],
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        attributes: json["attributes"] == null
            ? null
            : PurpleAttributes.fromJson(json["attributes"]),
        createAt: json["create_at"] == null ? null : json["create_at"].toInt(),
        updateAt: json["update_at"] == null ? null : json["update_at"].toInt(),
        active: json["active"] == null ? null : json["active"],
        province: json["province"] == null
            ? null
            : Province.fromJson(json["province"]),
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "username": username == null ? null : username,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "attribute_set_id": attributeSetId == null ? null : attributeSetId,
        "roles": roles == null
            ? null
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "attributes": attributes == null ? null : attributes!.toJson(),
        "create_at": createAt == null ? null : createAt,
        "update_at": updateAt == null ? null : updateAt,
        "active": active == null ? null : active,
        "province": province == null ? null : province!.toJson(),
        "phone": phone == null ? null : phone,
      };
}

class PurpleAttributes {
  PurpleAttributes({
    this.parentEmail,
    // this.dateOfBirth,
    this.registerVerificationToken,
    this.sex,
    this.avatar,
    this.provinceIdsf,
    this.activedAt,
    this.tokenVerify,
    this.province,
    this.school,
    this.phone,
    this.provinceId,
    this.forgotPasswordExpireAt,
    this.forgotPasswordToken,
    this.attributesClass,
  });

  String? parentEmail;
  // String? dateOfBirth;
  String? registerVerificationToken;
  int? sex;
  String? avatar;
  String? provinceIdsf;
  String? activedAt;
  String? tokenVerify;
  String? province;
  String? school;
  String? phone;
  String? provinceId;
  String? forgotPasswordExpireAt;
  String? forgotPasswordToken;
  String? attributesClass;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        parentEmail: json["parent_email"] == null ? null : json["parent_email"],
        // dateOfBirth: json["date_of_birth"] == null ? null : json["date_of_birth"],
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        // sex: json["sex"] == null ? null : json["sex"].toInt(),
        avatar: json["avatar"] == null ? null : json["avatar"],
        provinceIdsf:
            json["province_idsf"] == null ? null : json["province_idsf"],
        activedAt: json["actived_at"] == null ? null : json["actived_at"],
        tokenVerify: json["token_verify"] == null ? null : json["token_verify"],
        province: json["province"] == null ? null : json["province"],
        school: json["school"] == null ? null : json["school"],
        phone: json["phone"] == null ? null : json["phone"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
        forgotPasswordExpireAt: json["forgot_password_expire_at"] == null
            ? null
            : json["forgot_password_expire_at"],
        forgotPasswordToken: json["forgot_password_token"] == null
            ? null
            : json["forgot_password_token"],
        attributesClass: json["class"] == null ? null : json["class"],
      );

  Map<String, dynamic> toJson() => {
        "parent_email": parentEmail == null ? null : parentEmail,
        // "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "register_verification_token": registerVerificationToken == null
            ? null
            : registerVerificationToken,
        "sex": sex == null ? null : sex,
        "avatar": avatar == null ? null : avatar,
        "province_idsf": provinceIdsf == null ? null : provinceIdsf,
        "actived_at": activedAt == null ? null : activedAt,
        "token_verify": tokenVerify == null ? null : tokenVerify,
        "province": province == null ? null : province,
        "school": school == null ? null : school,
        "phone": phone == null ? null : phone,
        "province_id": provinceId == null ? null : provinceId,
        "forgot_password_expire_at":
            forgotPasswordExpireAt == null ? null : forgotPasswordExpireAt,
        "forgot_password_token":
            forgotPasswordToken == null ? null : forgotPasswordToken,
        "class": attributesClass == null ? null : attributesClass,
      };
}

class Province {
  Province({
    this.id,
    this.code,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? code;
  String? title;
  dynamic createdAt;
  dynamic updatedAt;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        title: json["title"] == null ? null : json["title"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "title": title == null ? null : title,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
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

class CommentImage {
  CommentImage({
    this.source,
    this.id,
    this.commentId,
    this.createdAt,
    this.updatedAt,
  });

  String? source;
  int? id;
  int? commentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CommentImage.fromJson(Map<String, dynamic> json) => CommentImage(
        source: json["source"] == null ? null : json["source"],
        id: json["id"] == null ? null : json["id"],
        commentId: json["commentId"] == null ? null : json["commentId"],
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
        "commentId": commentId == null ? null : commentId,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class CommentCommentable {
  CommentCommentable({
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
    this.province,
    this.phone,
  });

  String? id;
  String? merchantCode;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? attributeSetId;
  List<Role>? roles;
  FluffyAttributes? attributes;
  double? createAt;
  double? updateAt;
  bool? active;
  Province? province;
  String? phone;

  factory CommentCommentable.fromJson(Map<String, dynamic> json) =>
      CommentCommentable(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        username: json["username"] == null ? null : json["username"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        attributeSetId:
            json["attribute_set_id"] == null ? null : json["attribute_set_id"],
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        attributes: json["attributes"] == null
            ? null
            : FluffyAttributes.fromJson(json["attributes"]),
        createAt:
            json["create_at"] == null ? null : json["create_at"].toDouble(),
        updateAt:
            json["update_at"] == null ? null : json["update_at"].toDouble(),
        active: json["active"] == null ? null : json["active"],
        province: json["province"] == null
            ? null
            : Province.fromJson(json["province"]),
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "username": username == null ? null : username,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "attribute_set_id": attributeSetId == null ? null : attributeSetId,
        "roles": roles == null
            ? null
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "attributes": attributes == null ? null : attributes!.toJson(),
        "create_at": createAt == null ? null : createAt,
        "update_at": updateAt == null ? null : updateAt,
        "active": active == null ? null : active,
        "province": province == null ? null : province!.toJson(),
        "phone": phone == null ? null : phone,
      };
}

class FluffyAttributes {
  FluffyAttributes({
    this.parentEmail,
    this.dateOfBirth,
    this.registerVerificationToken,
    this.sex,
    this.avatar,
    this.provinceIdsf,
    this.activedAt,
    this.tokenVerify,
    this.province,
    this.school,
    this.phone,
    this.provinceId,
    this.forgotPasswordExpireAt,
    this.forgotPasswordToken,
    this.attributesClass,
  });

  String? parentEmail;
  String? dateOfBirth;
  String? registerVerificationToken;
  dynamic sex;
  String? avatar;
  String? provinceIdsf;
  String? activedAt;
  String? tokenVerify;
  String? province;
  String? school;
  String? phone;
  String? provinceId;
  String? forgotPasswordExpireAt;
  String? forgotPasswordToken;
  String? attributesClass;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes(
        parentEmail: json["parent_email"] == null ? null : json["parent_email"],
        dateOfBirth:
            json["date_of_birth"] == null ? null : json["date_of_birth"],
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        sex: json["sex"],
        avatar: json["avatar"] == null || json["avatar"] == ""
            ? ""
            : json["avatar"],
        provinceIdsf:
            json["province_idsf"] == null ? null : json["province_idsf"],
        activedAt: json["actived_at"] == null ? null : json["actived_at"],
        tokenVerify: json["token_verify"] == null ? null : json["token_verify"],
        province: json["province"] == null ? null : json["province"],
        school: json["school"] == null ? null : json["school"],
        phone: json["phone"] == null ? null : json["phone"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
        forgotPasswordExpireAt: json["forgot_password_expire_at"] == null
            ? null
            : json["forgot_password_expire_at"],
        forgotPasswordToken: json["forgot_password_token"] == null
            ? null
            : json["forgot_password_token"],
        attributesClass: json["class"] == null ? null : json["class"],
      );

  Map<String, dynamic> toJson() => {
        "parent_email": parentEmail == null ? null : parentEmail,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "register_verification_token": registerVerificationToken == null
            ? null
            : registerVerificationToken,
        "sex": sex,
        "avatar": avatar == null ? null : avatar,
        "province_idsf": provinceIdsf == null ? null : provinceIdsf,
        "actived_at": activedAt == null ? null : activedAt,
        "token_verify": tokenVerify == null ? null : tokenVerify,
        "province": province == null ? null : province,
        "school": school == null ? null : school,
        "phone": phone == null ? null : phone,
        "province_id": provinceId == null ? null : provinceId,
        "forgot_password_expire_at":
            forgotPasswordExpireAt == null ? null : forgotPasswordExpireAt,
        "forgot_password_token":
            forgotPasswordToken == null ? null : forgotPasswordToken,
        "class": attributesClass == null ? null : attributesClass,
      };
}
