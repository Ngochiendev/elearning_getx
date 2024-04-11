class Coupon {
  int? id;
  String? code;
  String? discountType;
  String? programType;
  String? description;
  String? title;
  int? amount;
  String? packageId;
  String? adminId;
  bool? isActive;
  String? appliedAt;
  String? appliedTo;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  dynamic package;

  Coupon(
      {this.id,
      this.code,
      this.discountType,
      this.programType,
      this.description,
      this.title,
      this.amount,
      this.packageId,
      this.adminId,
      this.isActive,
      this.appliedAt,
      this.appliedTo,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.package});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discountType = json['discountType'];
    programType = json['programType'];
    description = json['description'];
    title = json['title'];
    amount = json['amount'];
    packageId = json['packageId'];
    adminId = json['adminId'];
    isActive = json['isActive'];
    appliedAt = json['appliedAt'];
    appliedTo = json['appliedTo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    package = json['package'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['discountType'] = discountType;
    data['programType'] = programType;
    data['description'] = description;
    data['title'] = title;
    data['amount'] = amount;
    data['packageId'] = packageId;
    data['adminId'] = adminId;
    data['isActive'] = isActive;
    data['appliedAt'] = appliedAt;
    data['appliedTo'] = appliedTo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['package'] = package;
    return data;
  }
}
