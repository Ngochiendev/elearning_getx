// To parse this JSON data, do
//
//     final tableContent = tableContentFromJson(jsonString);

import 'dart:convert';

TableContent tableContentFromJson(String str) => TableContent.fromJson(json.decode(str));

String tableContentToJson(TableContent data) => json.encode(data.toJson());

class TableContent {
  TableContent({
    this.message,
    this.data,
  });

  String? message;
  TableOfContentData? data;

  factory TableContent.fromJson(Map<String, dynamic> json) => TableContent(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : TableOfContentData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class TableOfContentData {
  TableOfContentData({
    this.tableOfContents,
  });

  List<TableOfContent>? tableOfContents;

  factory TableOfContentData.fromJson(Map<String, dynamic> json) => TableOfContentData(
    tableOfContents: json["tableOfContents"] == null ? null : List<TableOfContent>.from(json["tableOfContents"].map((x) => TableOfContent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tableOfContents": tableOfContents == null ? null : List<dynamic>.from(tableOfContents!.map((x) => x.toJson())),
  };
}

class TableOfContent {
  TableOfContent({
    this.id,
    this.bookId,
    this.parentId,
    this.orderId,
    this.title,
    this.pageFrom,
    this.pageTo,
    this.createdAt,
    this.updatedAt,
    this.children,
  });

  int? id;
  int? bookId;
  int? parentId;
  int? orderId;
  String? title;
  int? pageFrom;
  int? pageTo;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<TableOfContent>? children;

  factory TableOfContent.fromJson(Map<String, dynamic> json) => TableOfContent(
    id: json["id"] == null ? null : json["id"],
    bookId: json["bookId"] == null ? null : json["bookId"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    title: json["title"] == null ? null : json["title"],
    pageFrom: json["pageFrom"] == null ? null : json["pageFrom"],
    pageTo: json["pageTo"] == null ? null : json["pageTo"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    children: json["children"] == null ? null : List<TableOfContent>.from(json["children"].map((x) => TableOfContent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "bookId": bookId == null ? null : bookId,
    "parentId": parentId == null ? null : parentId,
    "orderId": orderId == null ? null : orderId,
    "title": title == null ? null : title,
    "pageFrom": pageFrom == null ? null : pageFrom,
    "pageTo": pageTo == null ? null : pageTo,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "children": children == null ? null : List<dynamic>.from(children!.map((x) => x.toJson())),
  };
}
