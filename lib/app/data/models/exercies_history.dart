// To parse this JSON data, do
//
//     final questionHistory = questionHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/app/data/models/question_content_model.dart';

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
  DataUserExercises? data;

  factory QuestionHistory.fromJson(Map<String, dynamic> json) =>
      QuestionHistory(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : DataUserExercises.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataUserExercises {
  DataUserExercises({
    this.userExercise,
  });

  UserExercise? userExercise;
  factory DataUserExercises.fromJson(Map<String, dynamic> json) =>
      DataUserExercises(
        userExercise: json["userExercise"] == null
            ? null
            : UserExercise.fromJson(json["userExercise"]),
      );

  Map<String, dynamic> toJson() => {
        "userExercise": userExercise == null ? null : userExercise!.toJson(),
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
    this.exercise,
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
  List<Questions>? questions;
  Exercise? exercise;

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
            : List<Questions>.from(
                json["questions"].map((x) => Questions.fromJson(x))),
        exercise: json["exercise"] == null
            ? null
            : Exercise.fromJson(json["exercise"]),
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
        "exercise": exercise == null ? null : exercise!.toJson(),
      };
}

class Exercise {
  Exercise({
    this.id,
    this.exerciseLibrary,
    this.title,
    this.description,
    this.duration,
    this.totalPoints,
    this.status,
    this.isShuffle,
    this.displayType,
    this.ownerAbleId,
    this.ownerAbleType,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? exerciseLibrary;
  String? title;
  String? description;
  int? duration;
  int? totalPoints;
  String? status;
  bool? isShuffle;
  String? displayType;
  String? ownerAbleId;
  String? ownerAbleType;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"] == null ? null : json["id"],
        exerciseLibrary: json["library"] == null ? null : json["library"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        duration: json["duration"] == null ? null : json["duration"],
        totalPoints: json["totalPoints"] == null ? null : json["totalPoints"],
        status: json["status"] == null ? null : json["status"],
        isShuffle: json["isShuffle"] == null ? null : json["isShuffle"],
        displayType: json["displayType"] == null ? null : json["displayType"],
        ownerAbleId: json["ownerAbleId"] == null ? null : json["ownerAbleId"],
        ownerAbleType:
            json["ownerAbleType"] == null ? null : json["ownerAbleType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "library": exerciseLibrary == null ? null : exerciseLibrary,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "duration": duration == null ? null : duration,
        "totalPoints": totalPoints == null ? null : totalPoints,
        "status": status == null ? null : status,
        "isShuffle": isShuffle == null ? null : isShuffle,
        "displayType": displayType == null ? null : displayType,
        "ownerAbleId": ownerAbleId == null ? null : ownerAbleId,
        "ownerAbleType": ownerAbleType == null ? null : ownerAbleType,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Questions {
  int? id;
  int? userExerciseId;
  String? questionType;
  String? displayContent;
  String? goalContent;
  MinigameContent? mDisplayContent;
  MinigameContent? mGoalContent;
  QuestionContent? qDisplayContent;
  QuestionContent? qGoalContent;
  List<QuestionContent>? children;
  double? allocatedPoint;
  int? pointEarned;
  String? createdAt;
  String? updatedAt;

  Questions(
      {this.id,
      this.userExerciseId,
      this.questionType,
      this.displayContent,
      this.goalContent,
      this.allocatedPoint,
      this.pointEarned,
      this.createdAt,
      this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userExerciseId = json['userExerciseId'];
    questionType = json['questionType'];
    displayContent = json['displayContent'];
    goalContent = json['goalContent'];

    if (questionType == ExerciseTypes.miniGame) {
      try {
        mDisplayContent =
            MinigameContent.fromJson(jsonDecode(displayContent ?? ""));
        mGoalContent = MinigameContent.fromJson(jsonDecode(goalContent ?? ""));
      } catch (e) {}
    } else if (questionType == ExerciseTypes.question) {
      try {
        qDisplayContent =
            QuestionContent.fromJson(jsonDecode(displayContent ?? ""));
        qGoalContent = QuestionContent.fromJson(jsonDecode(goalContent ?? ""));
      } catch (e) {}
      if (qDisplayContent?.type == QuestionTypes.leadingQuestion) {
        if (json['children'] != null) {
          children = <QuestionContent>[];
          json['children'].forEach((v) {
            children!
                .add(QuestionContent.fromJson(Map<String, dynamic>.from(v)));
          });
        }
      }
    }
    allocatedPoint = double.tryParse(json['allocatedPoint'].toString()) ?? 0;
    pointEarned = int.tryParse(json['pointEarned'].toString()) ?? 0;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userExerciseId'] = userExerciseId;
    data['questionType'] = questionType;
    data['displayContent'] = displayContent;
    data['goalContent'] = goalContent;
    data['allocatedPoint'] = allocatedPoint;
    data['pointEarned'] = pointEarned;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    if (mDisplayContent != null) {
      data['mDisplayContent'] = mDisplayContent!.toJson();
    }
    if (mGoalContent != null) {
      data['mGoalContent'] = mGoalContent!.toJson();
    }
    if (qDisplayContent != null) {
      data['qDisplayContent'] = qDisplayContent!.toJson();
    }
    if (qGoalContent != null) {
      data['qGoalContent'] = qGoalContent!.toJson();
    }
    return data;
  }
}
