import 'package:elearning/app/data/models/book_models/list_books_model.dart';

class BookCategoryIsHomeDisplayedModel {
  Cate? category;
  List<ListBooksModel>? books;
  BookCategoryIsHomeDisplayedModel({
    this.category,
    this.books,
  });

   factory BookCategoryIsHomeDisplayedModel.fromJson(Map<String, dynamic> json) => BookCategoryIsHomeDisplayedModel(
        category: json["category"] == null ? null : Cate.fromJson(json["category"]),
        books: json["books"] == null ? null : List<ListBooksModel>.from(json["books"].map((x) => ListBooksModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": category == null ? null : category!.toJson(),
        "books": books == null ? null : List<dynamic>.from(books!.map((x) => x.toJson())),
    };
}
class Cate {
    Cate({
        this.id,
        this.parentId,
        this.name,
        this.slug,
        this.isHomeDisplayed,
        this.createdAt,
        this.updatedAt,
        this.type,
    });

    int? id;
    dynamic? parentId;
    String? name;
    String? slug;
    bool? isHomeDisplayed;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? type;

    factory Cate.fromJson(Map<String, dynamic> json) => Cate(
        id: json["id"] == null ? null : json["id"],
        parentId: json["parentId"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        isHomeDisplayed: json["isHomeDisplayed"] == null ? null : json["isHomeDisplayed"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parentId": parentId,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "isHomeDisplayed": isHomeDisplayed == null ? null : isHomeDisplayed,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "type": type == null ? null : type,
    };
}