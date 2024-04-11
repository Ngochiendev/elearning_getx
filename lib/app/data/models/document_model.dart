class DocumentsModel {
  int? id;
  int? sessionId;
  int? bookId;
  String? fileName;
  String? source;
  String? fileType;
  bool? isPublic;
  int? size;
  String? createdAt;
  String? updatedAt;
  DocumentsModel({
    this.id,
    this.sessionId,
    this.bookId,
    this.fileName,
    this.source,
    this.fileType,
    this.isPublic,
    this.size,
    this.createdAt,
    this.updatedAt,
  });

  DocumentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionId = json['sessionId'];
    bookId = json['bookId'];
    fileName = json['fileName'];
    source = json['source'];
    fileType = json['fileType'];
    isPublic = json['isPublic'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sessionId'] = sessionId;
    data['bookId'] = bookId;
    data['fileName'] = fileName;
    data['source'] = source;
    data['fileType'] = fileType;
    data['isPublic'] = isPublic;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
