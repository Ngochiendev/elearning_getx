// To parse this JSON data, do
//
//     final purchaseCombo = purchaseComboFromJson(jsonString);

import 'dart:convert';

PurchaseCombo purchaseComboFromJson(String str) => PurchaseCombo.fromJson(json.decode(str));

String purchaseComboToJson(PurchaseCombo data) => json.encode(data.toJson());

class PurchaseCombo {
  PurchaseCombo({
    this.message,
    this.data,
  });

  String? message;
  DataCombo? data;

  factory PurchaseCombo.fromJson(Map<String, dynamic> json) => PurchaseCombo(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : DataCombo.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class DataCombo {
  DataCombo({
    this.purchaseCombo,
  });

  List<PurchaseComboElement>? purchaseCombo;

  factory DataCombo.fromJson(Map<String, dynamic> json) => DataCombo(
    purchaseCombo: json["purchaseCombo"] == null ? null : List<PurchaseComboElement>.from(json["purchaseCombo"].map((x) => PurchaseComboElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "purchaseCombo": purchaseCombo == null ? null : List<dynamic>.from(purchaseCombo!.map((x) => x.toJson())),
  };
}

class PurchaseComboElement {
  PurchaseComboElement({
    this.id,
    this.title,
    this.quantity,
    this.discountPercentage,
    this.description,
    this.adminId,
    this.isActive,
    this.appliedAt,
    this.appliedTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? title;
  int? quantity;
  int? discountPercentage;
  String? description;
  String? adminId;
  bool? isActive;
  DateTime? appliedAt;
  DateTime? appliedTo;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory PurchaseComboElement.fromJson(Map<String, dynamic> json) => PurchaseComboElement(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    discountPercentage: json["discountPercentage"] == null ? null : json["discountPercentage"],
    description: json["description"] == null ? null : json["description"],
    adminId: json["adminId"] == null ? null : json["adminId"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    appliedAt: json["appliedAt"] == null ? null : DateTime.parse(json["appliedAt"]),
    appliedTo: json["appliedTo"] == null ? null : DateTime.parse(json["appliedTo"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "quantity": quantity == null ? null : quantity,
    "discountPercentage": discountPercentage == null ? null : discountPercentage,
    "description": description == null ? null : description,
    "adminId": adminId == null ? null : adminId,
    "isActive": isActive == null ? null : isActive,
    "appliedAt": appliedAt == null ? null : appliedAt?.toIso8601String(),
    "appliedTo": appliedTo == null ? null : appliedTo?.toIso8601String(),
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
