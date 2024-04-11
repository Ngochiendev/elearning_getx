// To parse this JSON data, do
//
//     final exercisesBook = exercisesBookFromJson(jsonString);

import 'dart:convert';

ExercisesBook exercisesBookFromJson(String str) => ExercisesBook.fromJson(json.decode(str));

String exercisesBookToJson(ExercisesBook data) => json.encode(data.toJson());

class ExercisesBook {
    ExercisesBook({
        this.message,
        this.data,
    });

    String? message;
    DataExercises? data;

    factory ExercisesBook.fromJson(Map<String, dynamic> json) => ExercisesBook(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataExercises.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class DataExercises {
    DataExercises({
        this.exercises,
    });

    List<Exercise>? exercises;

    factory DataExercises.fromJson(Map<String, dynamic> json) => DataExercises(
        exercises: json["exercises"] == null ? null : List<Exercise>.from(json["exercises"].map((x) => Exercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "exercises": exercises == null ? null : List<dynamic>.from(exercises!.map((x) => x.toJson())),
    };
}

class Exercise {
    Exercise({
        this.id,
        this.bookId,
        this.exerciseId,
        this.pageFrom,
        this.pageTo,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? bookId;
    int? exerciseId;
    int? pageFrom;
    int? pageTo;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic? deletedAt;

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"] == null ? null : json["id"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
        pageFrom: json["pageFrom"] == null ? null : json["pageFrom"],
        pageTo: json["pageTo"] == null ? null : json["pageTo"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "bookId": bookId == null ? null : bookId,
        "exerciseId": exerciseId == null ? null : exerciseId,
        "pageFrom": pageFrom == null ? null : pageFrom,
        "pageTo": pageTo == null ? null : pageTo,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
    };
}
