// To parse this JSON data, do
//
//     final myrating = myratingFromJson(jsonString);

import 'dart:convert';

Myrating myratingFromJson(String str) => Myrating.fromJson(json.decode(str));

String myratingToJson(Myrating data) => json.encode(data.toJson());

class Myrating {
    Myrating({
        this.message,
        this.data,
    });

    String? message;
    DataMyRate? data;

    factory Myrating.fromJson(Map<String, dynamic> json) => Myrating(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataMyRate.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class DataMyRate {
    DataMyRate({
        this.rating,
    });

    MyRating? rating;

    factory DataMyRate.fromJson(Map<String, dynamic> json) => DataMyRate(
        rating: json["rating"] == null ? null : MyRating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "rating": rating == null ? null : rating!.toJson(),
    };
}

class MyRating {
    MyRating({
        this.id,
        this.courseId,
        this.userId,
        this.rating,
        this.content,
        this.status,
        this.createdAt,
        this.updatedAt,
        
    });

    int? id;
    int? courseId;
    String? userId;
    int? rating;
    String? content;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;


    factory MyRating.fromJson(Map<String, dynamic> json) => MyRating(
        id: json["id"] == null ? null : json["id"],
        courseId: json["courseId"] == null ? null : json["courseId"],
        userId: json["userId"] == null ? null : json["userId"],
        rating: json["rating"] == null ? 0 : json["rating"],
        content: json["content"] == null ? null : json["content"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
       
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "courseId": courseId == null ? null : courseId,
        "userId": userId == null ? null : userId,
        "rating": rating == null ? null : rating,
        "content": content == null ? null : content,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        
    };
}




