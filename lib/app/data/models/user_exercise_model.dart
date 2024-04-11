import 'dart:convert';

import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/app/data/models/question_content_model.dart';

class UserExerciseResponse {
  Exercise? exercise;
  UserExercise? userExercise;

  UserExerciseResponse({this.exercise, this.userExercise});

  UserExerciseResponse.fromJson(Map<String, dynamic> json) {
    exercise =
        json['exercise'] != null ? Exercise.fromJson(json['exercise']) : null;
    userExercise = json['userExercise'] != null
        ? UserExercise.fromJson(json['userExercise'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (exercise != null) {
      data['exercise'] = exercise?.toJson();
    }
    if (userExercise != null) {
      data['userExercise'] = userExercise?.toJson();
    }
    return data;
  }
}

class Exercise {
  int? id;
  String? library;
  String? title;
  String? description;
  int? duration;
  int? totalPoints;
  String? status;
  bool? isShuffle;
  String? displayType;
  String? createdAt;
  String? updatedAt;
  int? totalQuestions;
  int? totalConfigQuestions;

  Exercise(
      {this.id,
      this.library,
      this.title,
      this.description,
      this.duration,
      this.totalPoints,
      this.status,
      this.isShuffle,
      this.displayType,
      this.createdAt,
      this.updatedAt,
      this.totalQuestions,
      this.totalConfigQuestions});

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    library = json['library'];
    title = json['title'];
    description = json['description'];
    duration = json['duration'];
    totalPoints = json['totalPoints'];
    status = json['status'];
    isShuffle = json['isShuffle'];
    displayType = json['displayType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalQuestions = json['totalQuestions'];
    totalConfigQuestions = json['totalConfigQuestions'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['library'] = library;
    data['title'] = title;
    data['description'] = description;
    data['duration'] = duration;
    data['totalPoints'] = totalPoints;
    data['status'] = status;
    data['isShuffle'] = isShuffle;
    data['displayType'] = displayType;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['totalQuestions'] = totalQuestions;
    data['totalConfigQuestions'] = totalConfigQuestions;
    return data;
  }
}

class UserExercise {
  int? id;
  String? exercisableType;
  int? exercisableId;
  int? exerciseId;
  String? title;
  String? description;
  String? status;
  int? duration;
  String? createdAt;
  String? updatedAt;
  double? totalPointEarned;
  double? totalPoints;
  List<Questions>? questions;

  UserExercise(
      {this.id,
      this.exercisableType,
      this.exercisableId,
      this.exerciseId,
      this.title,
      this.description,
      this.status,
      this.duration,
      this.createdAt,
      this.updatedAt,
      this.totalPointEarned,
      this.totalPoints,
      this.questions});

  UserExercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exercisableType = json['exercisableType'];
    exercisableId = int.tryParse('${json['exercisableId']}') ?? 0;
    exerciseId = json['exerciseId'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    duration = json['duration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalPointEarned = json["totalPointEarned"] == null
        ? null
        : double.parse(json["totalPointEarned"].toString());
    totalPoints = json["totalPoints"] == null
        ? null
        : double.parse(json["totalPoints"].toString());
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['exercisableType'] = exercisableType;
    data['exercisableId'] = exercisableId;
    data['exerciseId'] = exerciseId;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['duration'] = duration;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (questions != null) {
      data['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
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
