// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ReadingBookModel welcomeFromJson(String str) => ReadingBookModel.fromJson(json.decode(str));

String welcomeToJson(ReadingBookModel data) => json.encode(data.toJson());

class ReadingBookModel {
    ReadingBookModel({
        this.message,
        this.data,
    });

    String? message;
    DataPage? data;

    factory ReadingBookModel.fromJson(Map<String, dynamic> json) => ReadingBookModel(
         message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataPage.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
         "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class DataPage {
    DataPage({
        this.rows,
        this.pagination,
    });

    List<Rows>? rows;
    Pagination? pagination;

    factory DataPage.fromJson(Map<String, dynamic> json) => DataPage(
        rows: json["rows"] == null ? null : List<Rows>.from(json["rows"].map((x) => Rows.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
         "rows": rows == null ? null : List<dynamic>.from(rows!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination!.toJson(),
    };
}

class Pagination {
    Pagination({
        this.total,
        this.page,
        this.perPage,
    });

    int? total;
    String? page;
    int? perPage;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
       total: json["total"] == null ? null : json["total"],
        page: json["page"] == null ? null : json["page"],
        perPage: json["perPage"] == null ? null : json["perPage"],
    );

    Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "page": page == null ? null : page,
        "perPage": perPage == null ? null : perPage,
    };
}

class Rows {
    Rows({
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
    List<Attachment>? attachments;
    List<BookExercise>? bookExercises;

    factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        image: json["image"] == null ? null : json["image"],
        id: json["id"] == null ? null : json["id"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        fileName: json["fileName"] == null ? null : json["fileName"],
        isAllowTrial: json["isAllowTrial"] == null ? null : json["isAllowTrial"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        bookTitle: json["bookTitle"] == null ? null : json["bookTitle"],
        attachments: json["attachments"] == null ? null : List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
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

class Attachment {
    Attachment({
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

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
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
    DateTime?createdAt;
    DateTime?updatedAt;
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

