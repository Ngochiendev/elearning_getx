class NewsModel {
  int? id;
  int? categoryId;
  int? view;
  String? title;
  String? slug;
  String? content;
  String? summary;
  String? author;
  String? type;
  String? thumbnail;
  bool? isPublic;
  String? createdAt;
  String? updatedAt;
  String? newsCategory;
  List? relatedNews;
  NewsModel({
    this.id,
    this.title,
    this.slug,
    this.type,
    this.categoryId,
    this.view,
    this.thumbnail,
    this.content,
    this.summary,
    this.author,
    this.isPublic,
    this.createdAt,
    this.updatedAt,
    this.newsCategory,
    this.relatedNews,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    categoryId = json['categoryId'];
    type = json['type'];
    thumbnail = json['thumbnail'];
    author = json['author'];
    summary = json['summary'];
    content = json['content'];
    view = json['view'];
    isPublic = json['isPublic'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    newsCategory = json['newsCategory'];
    relatedNews = json['relatedNews'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['author'] = author;
    data['summary'] = summary;
    data['thumbnail'] = thumbnail;
    data['content'] = content;
    data['view'] = view;
    data['categoryId'] = categoryId;
    data['type'] = type;
    data['isPublic'] = isPublic;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['newsCategory'] = newsCategory;
    data['relatedNews'] = relatedNews;
    return data;
  }
}
