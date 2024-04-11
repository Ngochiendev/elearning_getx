// To parse this JSON data, do
//
//     final historyExercise = historyExerciseFromJson(jsonString);

import 'dart:convert';

import 'package:elearning/app/data/models/book_models/rating_book_model.dart';

UserRating historyExerciseFromJson(String str) => UserRating.fromJson(json.decode(str));

String historyExerciseToJson(UserRating data) => json.encode(data.toJson());

class UserRating {
  UserRating({
    this.message,
    this.data,
  });

  final String? message;
  final DataRating? data;

  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
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
    this.rating,
  });

  final RatingUser? rating;

  factory DataRating.fromJson(Map<String, dynamic> json) => DataRating(
    rating: json["rating"] == null ? null : RatingUser.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "rating": rating == null ? null : rating!.toJson(),
  };
}

class RatingUser {
  RatingUser({
    this.id,
    this.bookId,
    this.userId,
    this.rating,
    this.content,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.courseId,
  });

  final int? id;
  final int? bookId;
  final int? courseId;
  final String? userId;
  final int? rating;
  final String? content;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  factory RatingUser.fromJson(Map<String, dynamic> json) => RatingUser(
    id: json["id"] == null ? null : json["id"],
    bookId: json["bookId"] == null ? null : json["bookId"],
    courseId: json["courseId"] == null ? null : json["courseId"],
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



