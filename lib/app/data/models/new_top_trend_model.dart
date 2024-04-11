// To parse this JSON data, do
//
//     final newsTopTrend = newsTopTrendFromJson(jsonString);

import 'dart:convert';

NewsTopTrend newsTopTrendFromJson(String str) =>
    NewsTopTrend.fromJson(json.decode(str));

String newsTopTrendToJson(NewsTopTrend data) => json.encode(data.toJson());

class NewsTopTrend {
  NewsTopTrend({
    this.message,
    this.data,
  });

  String? message;
  DataNews? data;

  factory NewsTopTrend.fromJson(Map<String, dynamic> json) => NewsTopTrend(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataNews.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataNews {
  DataNews({
    this.newsCategory,
  });

  NewsCategory? newsCategory;

  factory DataNews.fromJson(Map<String, dynamic> json) => DataNews(
        newsCategory: json["newsCategory"] == null
            ? null
            : NewsCategory.fromJson(json["newsCategory"]),
      );

  Map<String, dynamic> toJson() => {
        "newsCategory": newsCategory == null ? null : newsCategory!.toJson(),
      };
}

class NewsCategory {
  NewsCategory({
    this.id,
    this.name,
    this.isHomeDisplayed,
    this.createdAt,
    this.updatedAt,
    this.news,
  });

  int? id;
  String? name;
  bool? isHomeDisplayed;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<News>? news;

  factory NewsCategory.fromJson(Map<String, dynamic> json) => NewsCategory(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        isHomeDisplayed:
            json["isHomeDisplayed"] == null ? null : json["isHomeDisplayed"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        news: json["news"] == null
            ? null
            : List<News>.from(json["news"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "isHomeDisplayed": isHomeDisplayed == null ? null : isHomeDisplayed,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "news": news == null
            ? null
            : List<dynamic>.from(news!.map((x) => x.toJson())),
      };
}

class News {
  News({
    this.thumbnail,
    this.id,
    this.categoryId,
    this.title,
    this.content,
    this.summary,
    this.author,
    this.slug,
    this.isPublic,
    this.view,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  String? thumbnail;
  int? id;
  int? categoryId;
  String? title;
  String? content;
  String? summary;
  String? author;
  String? slug;
  bool? isPublic;
  int? view;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory News.fromJson(Map<String, dynamic> json) => News(
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        id: json["id"] == null ? null : json["id"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        summary: json["summary"] == null ? null : json["summary"],
        author: json["author"] == null ? null : json["author"],
        slug: json["slug"] == null ? null : json["slug"],
        isPublic: json["isPublic"] == null ? null : json["isPublic"],
        view: json["view"] == null ? null : json["view"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail == null ? null : thumbnail,
        "id": id == null ? null : id,
        "categoryId": categoryId == null ? null : categoryId,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "summary": summary == null ? null : summary,
        "author": author == null ? null : author,
        "slug": slug == null ? null : slug,
        "isPublic": isPublic == null ? null : isPublic,
        "view": view == null ? null : view,
        "type": type == null ? null : type,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
