// To parse this JSON data, do
//
//     final learnExercise = learnExerciseFromJson(jsonString);

import 'dart:convert';

import 'package:elearning/app/data/models/user_couress_model.dart';

LearnExercise learnExerciseFromJson(String str) =>
    LearnExercise.fromJson(json.decode(str));

String learnExerciseToJson(LearnExercise data) => json.encode(data.toJson());

class LearnExercise {
  LearnExercise({
    this.message,
    this.data,
  });

  String? message;
  DataLearnExercise? data;

  factory LearnExercise.fromJson(Map<String, dynamic> json) => LearnExercise(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : DataLearnExercise.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataLearnExercise {
  DataLearnExercise({
    this.course,
    this.isCurrentProgress,
    this.userCourse,
    this.sessionExerciseIds,
  });

  Datum? course;
  IsCurrentProgress? isCurrentProgress;
  UserCourse? userCourse;
  List<SessionExerciseId>? sessionExerciseIds;

  factory DataLearnExercise.fromJson(Map<String, dynamic> json) =>
      DataLearnExercise(
        course: json["course"] == null ? null : Datum.fromJson(json["course"]),
        isCurrentProgress: json["isCurrentProgress"] == null
            ? null
            : IsCurrentProgress.fromJson(json["isCurrentProgress"]),
        userCourse: json["userCourse"] == null
            ? null
            : UserCourse.fromJson(json["userCourse"]),
        sessionExerciseIds: json["sessionExerciseIds"] == null
            ? null
            : List<SessionExerciseId>.from(json["sessionExerciseIds"]
                .map((x) => SessionExerciseId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "course": course == null ? null : course!.toJson(),
        "isCurrentProgress":
            isCurrentProgress == null ? null : isCurrentProgress!.toJson(),
        "userCourse": userCourse == null ? null : userCourse!.toJson(),
        "sessionExerciseIds": sessionExerciseIds == null
            ? null
            : List<dynamic>.from(sessionExerciseIds!.map((x) => x.toJson())),
      };
}

class IsCurrentProgress {
  IsCurrentProgress({
    this.id,
    this.userCourseId,
    this.sessionVideoId,
    this.isCurrentProgress,
    this.createdAt,
    this.updatedAt,
    this.sessionTitle,
  });

  int? id;
  int? userCourseId;
  int? sessionVideoId;
  bool? isCurrentProgress;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? sessionTitle;

  factory IsCurrentProgress.fromJson(Map<String, dynamic> json) =>
      IsCurrentProgress(
        id: json["id"] == null ? null : json["id"],
        userCourseId:
            json["userCourseId"] == null ? null : json["userCourseId"],
        sessionVideoId:
            json["sessionVideoId"] == null ? null : json["sessionVideoId"],
        isCurrentProgress: json["isCurrentProgress"] == null
            ? null
            : json["isCurrentProgress"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        sessionTitle:
            json["sessionTitle"] == null ? null : json["sessionTitle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userCourseId": userCourseId == null ? null : userCourseId,
        "sessionVideoId": sessionVideoId == null ? null : sessionVideoId,
        "isCurrentProgress":
            isCurrentProgress == null ? null : isCurrentProgress,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "sessionTitle": sessionTitle == null ? null : sessionTitle,
      };
}

class SessionExerciseId {
  SessionExerciseId({
    this.sessionId,
    this.exerciseId,
  });

  int? sessionId;
  int? exerciseId;

  factory SessionExerciseId.fromJson(Map<String, dynamic> json) =>
      SessionExerciseId(
        sessionId: json["sessionId"] == null ? null : json["sessionId"],
        exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
      );

  Map<String, dynamic> toJson() => {
        "sessionId": sessionId == null ? null : sessionId,
        "exerciseId": exerciseId == null ? null : exerciseId,
      };
}

class UserCourse {
  UserCourse({
    this.id,
    this.userId,
    this.courseId,
    this.activeAt,
    this.expireAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.totalTimeStudy,
  });

  int? id;
  String? userId;
  int? courseId;
  DateTime? activeAt;
  DateTime? expireAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? totalTimeStudy;

  factory UserCourse.fromJson(Map<String, dynamic> json) => UserCourse(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        courseId: json["courseId"] == null ? null : json["courseId"],
        activeAt:
            json["activeAt"] == null ? null : DateTime.parse(json["activeAt"]),
        expireAt:
            json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        totalTimeStudy:
            json["totalTimeStudy"] == null ? null : json["totalTimeStudy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "courseId": courseId == null ? null : courseId,
        "activeAt": activeAt == null ? null : activeAt!.toIso8601String(),
        "expireAt": expireAt == null ? null : expireAt!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "totalTimeStudy": totalTimeStudy == null ? null : totalTimeStudy,
      };
}
