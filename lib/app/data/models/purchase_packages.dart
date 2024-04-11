class PurchasePackagesModel {
  int? id;
  int? bookId;
  int? duration;
  int? retailPrice;
  int? discountPrice;
  String? createdAt;
  String? updatedAt;
  PurchasePackagesModel({
    this.id,
    this.bookId,
    this.duration,
    this.retailPrice,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
  });

  PurchasePackagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    duration = json['duration'];
    retailPrice = json['retailPrice'];
    discountPrice = json['discountPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['bookId'] = bookId;
    data['duration'] = duration;
    data['retailPrice'] = retailPrice;
    data['discountPrice'] = discountPrice;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
