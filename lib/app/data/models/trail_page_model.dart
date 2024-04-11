// To parse this JSON data, do
//
//     final trailPage = trailPageFromJson(jsonString);

import 'dart:convert';

TrailPage trailPageFromJson(String str) => TrailPage.fromJson(json.decode(str));

String trailPageToJson(TrailPage data) => json.encode(data.toJson());

class TrailPage {
    TrailPage({
        this.message,
        this.data,
    });

    String? message;
    DataTrailPage? data;

    factory TrailPage.fromJson(Map<String, dynamic> json) => TrailPage(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataTrailPage.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class DataTrailPage {
    DataTrailPage({
        this.pages,
    });

    List<PageTrail>? pages;

    factory DataTrailPage.fromJson(Map<String, dynamic> json) => DataTrailPage(
        pages: json["pages"] == null ? null : List<PageTrail>.from(json["pages"].map((x) => PageTrail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pages": pages == null ? null : List<dynamic>.from(pages!.map((x) => x.toJson())),
    };
}

class PageTrail {
    PageTrail({
        this.image,
        this.id,
        this.bookId,
        this.orderId,
        this.fileName,
        this.isAllowTrial,
        this.createdAt,
        this.updatedAt,
        this.bookTitle,
        this.attachments,
        this.bookExercises,
    });

    String? image;
    int? id;
    int? bookId;
    int? orderId;
    String? fileName;
    bool? isAllowTrial;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? bookTitle;
    List<AttachmentTrail>? attachments;
    List<BookExercise>? bookExercises;

    factory PageTrail.fromJson(Map<String, dynamic> json) => PageTrail(
        image: json["image"] == null ? null : json["image"],
        id: json["id"] == null ? null : json["id"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        fileName: json["fileName"] == null ? null : json["fileName"],
        isAllowTrial: json["isAllowTrial"] == null ? null : json["isAllowTrial"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        bookTitle: json["bookTitle"] == null ? null : json["bookTitle"],
        attachments: json["attachments"] == null ? null : List<AttachmentTrail>.from(json["attachments"].map((x) => AttachmentTrail.fromJson(x))),
        bookExercises: json["bookExercises"] == null ? null : List<BookExercise>.from(json["bookExercises"].map((x) => BookExercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "id": id == null ? null : id,
        "bookId": bookId == null ? null : bookId,
        "orderId": orderId == null ? null : orderId,
        "fileName": fileName == null ? null : fileName,
        "isAllowTrial": isAllowTrial == null ? null : isAllowTrial,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "bookTitle": bookTitle == null ? null : bookTitle,
        "attachments": attachments == null ? null : List<dynamic>.from(attachments!.map((x) => x.toJson())),
        "bookExercises": bookExercises == null ? null : List<dynamic>.from(bookExercises!.map((x) => x.toJson())),
    };
}

class AttachmentTrail {
    AttachmentTrail({
        this.source,
        this.id,
        this.pageId,
        this.type,
        this.content,
        this.horizontalPosition,
        this.verticalPosition,
        this.createdAt,
        this.updatedAt,
    });

    String? source;
    int? id;
    int? pageId;
    String? type;
    String? content;
    int? horizontalPosition;
    int? verticalPosition;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory AttachmentTrail.fromJson(Map<String, dynamic> json) => AttachmentTrail(
        source: json["source"] == null ? null : json["source"],
        id: json["id"] == null ? null : json["id"],
        pageId: json["pageId"] == null ? null : json["pageId"],
        type: json["type"] == null ? null : json["type"],
        content: json["content"] == null ? null : json["content"],
        horizontalPosition: json["horizontalPosition"] == null ? null : json["horizontalPosition"],
        verticalPosition: json["verticalPosition"] == null ? null : json["verticalPosition"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "source": source == null ? null : source,
        "id": id == null ? null : id,
        "pageId": pageId == null ? null : pageId,
        "type": type == null ? null : type,
        "content": content == null ? null : content,
        "horizontalPosition": horizontalPosition == null ? null : horizontalPosition,
        "verticalPosition": verticalPosition == null ? null : verticalPosition,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}

class BookExercise {
    BookExercise({
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
    dynamic deletedAt;

    factory BookExercise.fromJson(Map<String, dynamic> json) => BookExercise(
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
