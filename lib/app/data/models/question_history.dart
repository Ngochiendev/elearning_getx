// To parse this JSON data, do
//
//     final questionHistory = questionHistoryFromJson(jsonString);

import 'dart:convert';

QuestionHistory questionHistoryFromJson(String str) =>
    QuestionHistory.fromJson(json.decode(str));

String questionHistoryToJson(QuestionHistory data) =>
    json.encode(data.toJson());

class QuestionHistory {
  QuestionHistory({
    this.message,
    this.data,
  });

  String? message;
  DataUserExercise? data;

  factory QuestionHistory.fromJson(Map<String, dynamic> json) =>
      QuestionHistory(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : DataUserExercise.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataUserExercise {
  DataUserExercise({
    this.userExercises,
  });

  List<UserExercise>? userExercises;

  factory DataUserExercise.fromJson(Map<String, dynamic> json) =>
      DataUserExercise(
        userExercises: json["userExercises"] == null
            ? null
            : List<UserExercise>.from(
                json["userExercises"].map((x) => UserExercise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userExercises": userExercises == null
            ? null
            : List<dynamic>.from(userExercises!.map((x) => x.toJson())),
      };
}

class UserExercise {
  UserExercise({
    this.id,
    this.exercisableType,
    this.exercisableId,
    this.exerciseId,
    this.userId,
    this.title,
    this.description,
    this.status,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  int? id;
  String? exercisableType;
  int? exercisableId;
  int? exerciseId;
  String? userId;
  String? title;
  String? description;
  String? status;
  int? duration;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Question>? questions;

  factory UserExercise.fromJson(Map<String, dynamic> json) => UserExercise(
        id: json["id"] == null ? null : json["id"],
        exercisableType:
            json["exercisableType"] == null ? null : json["exercisableType"],
        exercisableId:
            json["exercisableId"] == null ? null : json["exercisableId"],
        exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
        userId: json["userId"] == null ? null : json["userId"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        duration: json["duration"] == null ? null : json["duration"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        questions: json["questions"] == null
            ? null
            : List<Question>.from(
                json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "exercisableType": exercisableType == null ? null : exercisableType,
        "exercisableId": exercisableId == null ? null : exercisableId,
        "exerciseId": exerciseId == null ? null : exerciseId,
        "userId": userId == null ? null : userId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "duration": duration == null ? null : duration,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "questions": questions == null
            ? null
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    this.id,
    this.userExerciseId,
    this.questionType,
    this.displayContent,
    this.goalContent,
    this.allocatedPoint,
    this.pointEarned,
    this.isMarked,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userExerciseId;
  String? questionType;
  String? displayContent;
  String? goalContent;
  int? allocatedPoint;
  double? pointEarned;
  bool? isMarked;
  dynamic comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"] == null ? null : json["id"],
        userExerciseId:
            json["userExerciseId"] == null ? null : json["userExerciseId"],
        questionType:
            json["questionType"] == null ? null : json["questionType"],
        displayContent:
            json["displayContent"] == null ? null : json["displayContent"],
        goalContent: json["goalContent"] == null ? null : json["goalContent"],
        allocatedPoint:
            json["allocatedPoint"] == null ? null : json["allocatedPoint"],
        pointEarned:
            json["pointEarned"] == null ? null : json["pointEarned"].toDouble(),
        isMarked: json["isMarked"] == null ? null : json["isMarked"],
        comment: json["comment"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userExerciseId": userExerciseId == null ? null : userExerciseId,
        "questionType": questionType == null ? null : questionType,
        "displayContent": displayContent == null ? null : displayContent,
        "goalContent": goalContent == null ? null : goalContent,
        "allocatedPoint": allocatedPoint == null ? null : allocatedPoint,
        "pointEarned": pointEarned == null ? null : pointEarned,
        "isMarked": isMarked == null ? null : isMarked,
        "comment": comment,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
