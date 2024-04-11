// To parse this JSON data, do
//
//     final ratingCourseModel = ratingCourseModelFromJson(jsonString);

import 'dart:convert';

RatingCourseModel ratingCourseModelFromJson(String str) => RatingCourseModel.fromJson(json.decode(str));

String ratingCourseModelToJson(RatingCourseModel data) => json.encode(data.toJson());

class RatingCourseModel {

  RatingCourseModel({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory RatingCourseModel.fromJson(Map<String, dynamic> json) => RatingCourseModel(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.rating,
  });

  Rating? rating;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "rating": rating == null ? null : rating!.toJson(),
  };
}

class Rating {
  Rating({
    this.status,
    this.id,
    this.rating,
    this.content,
    this.courseId,
    this.userId,
    this.updatedAt,
    this.createdAt,
  });

  String? status;
  int? id;
  int? rating;
  String? content;
  String? courseId;
  String? userId;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    status: json["status"] == null ? null : json["status"],
    id: json["id"] == null ? null : json["id"],
    rating: json["rating"] == null ? null : json["rating"],
    content: json["content"] == null ? null : json["content"],
    courseId: json["courseId"] == null ? null : json["courseId"],
    userId: json["userId"] == null ? null : json["userId"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "id": id == null ? null : id,
    "rating": rating == null ? null : rating,
    "content": content == null ? null : content,
    "courseId": courseId == null ? null : courseId,
    "userId": userId == null ? null : userId,
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
  };
}
