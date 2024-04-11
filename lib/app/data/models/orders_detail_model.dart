// To parse this JSON data, do
//
//     final ordersDetails = ordersDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:elearning/app/data/models/book_models/book_history_model.dart';

OrdersDetails ordersDetailsFromJson(String str) => OrdersDetails.fromJson(json.decode(str));

String ordersDetailsToJson(OrdersDetails data) => json.encode(data.toJson());

class OrdersDetails {
  OrdersDetails({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory OrdersDetails.fromJson(Map<String, dynamic> json) => OrdersDetails(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.order,
  });

  OrderCourseHistory? order;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    order: json["order"] == null ? null : OrderCourseHistory.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "order": order == null ? null : order?.toJson(),
  };
}

class OrderCourseHistory {
  OrderCourseHistory({
    this.id,
    this.merchantCode,
    this.orderDate,
    this.orderExpiredDate,
    this.customerId,
    this.orderItems,
    this.orderStatus,
    this.payment,
    this.couponIds,
    this.productSource,
    this.totalPrice,
    this.totalDiscount,
    this.taxPercent,
    this.totalTax,
    this.finalAmount,
    this.couponCode,
    this.comboDiscount,
  });

  String? id;
  String? merchantCode;
  double? orderDate;
  double? orderExpiredDate;
  String? customerId;
  List<OrderItem>? orderItems;
  String? orderStatus;
  Payment? payment;
  List<String>? couponIds;
  String? productSource;
  int? totalPrice;
  int? totalDiscount;
  int? taxPercent;
  int? totalTax;
  int? finalAmount;
  List<dynamic>? couponCode;
  List<ComboDiscount>? comboDiscount;

  factory OrderCourseHistory.fromJson(Map<String, dynamic> json) => OrderCourseHistory(
    id: json["id"] == null ? null : json["id"],
    merchantCode: json["merchant_code"] == null ? null : json["merchant_code"],
    orderDate: json["order_date"] == null ? null : json["order_date"].toDouble(),
    orderExpiredDate: json["order_expired_date"] == null ? null : json["order_expired_date"].toDouble(),
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    orderItems: json["order_items"] == null ? null : List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
    orderStatus: json["order_status"] == null ? null : json["order_status"],
    payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
    couponIds: json["coupon_ids"] == null ? null : List<String>.from(json["coupon_ids"].map((x) => x)),
    productSource: json["product_source"] == null ? null : json["product_source"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    totalDiscount: json["total_discount"] == null ? null : json["total_discount"],
    taxPercent: json["tax_percent"] == null ? null : json["tax_percent"],
    totalTax: json["total_tax"] == null ? null : json["total_tax"],
    finalAmount: json["final_amount"] == null ? null : json["final_amount"],
    couponCode: json["couponCode"] == null ? null : List<dynamic>.from(json["couponCode"].map((x) => x)),
    comboDiscount: json["comboDiscount"] == null ? null : List<ComboDiscount>.from(json["comboDiscount"].map((x) => ComboDiscount.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "merchant_code": merchantCode == null ? null : merchantCode,
    "order_date": orderDate == null ? null : orderDate,
    "order_expired_date": orderExpiredDate == null ? null : orderExpiredDate,
    "customer_id": customerId == null ? null : customerId,
    "order_items": orderItems == null ? null : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
    "order_status": orderStatus == null ? null : orderStatus,
    "payment": payment == null ? null : payment!.toJson(),
    "coupon_ids": couponIds == null ? null : List<dynamic>.from(couponIds!.map((x) => x)),
    "product_source": productSource == null ? null : productSource,
    "total_price": totalPrice == null ? null : totalPrice,
    "total_discount": totalDiscount == null ? null : totalDiscount,
    "tax_percent": taxPercent == null ? null : taxPercent,
    "total_tax": totalTax == null ? null : totalTax,
    "final_amount": finalAmount == null ? null : finalAmount,
    "couponCode": couponCode == null ? null : List<dynamic>.from(couponCode!.map((x) => x)),
    "comboDiscount": comboDiscount == null ? null : List<dynamic>.from(comboDiscount!.map((x) => x.toJson())),
  };
}

class ComboDiscount {
  ComboDiscount({
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

  factory ComboDiscount.fromJson(Map<String, dynamic> json) => ComboDiscount(
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
    "appliedAt": appliedAt == null ? null : appliedAt!.toIso8601String(),
    "appliedTo": appliedTo == null ? null : appliedTo!.toIso8601String(),
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class OrderItem {
  OrderItem({
    this.id,
    this.productId,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
    this.unitDiscount,
    this.totalDiscount,
    this.finalAmount,
    this.infoProduct,
  });

  String? id;
  String? productId;
  int? quantity;
  int? unitPrice;
  int? totalPrice;
  int? unitDiscount;
  int? totalDiscount;
  int? finalAmount;
  InfoProduct? infoProduct;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    unitPrice: json["unit_price"] == null ? null : json["unit_price"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    unitDiscount: json["unit_discount"] == null ? null : json["unit_discount"],
    totalDiscount: json["total_discount"] == null ? null : json["total_discount"],
    finalAmount: json["final_amount"] == null ? null : json["final_amount"],
    infoProduct: json["infoProduct"] == null ? null : InfoProduct.fromJson(json["infoProduct"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "quantity": quantity == null ? null : quantity,
    "unit_price": unitPrice == null ? null : unitPrice,
    "total_price": totalPrice == null ? null : totalPrice,
    "unit_discount": unitDiscount == null ? null : unitDiscount,
    "total_discount": totalDiscount == null ? null : totalDiscount,
    "final_amount": finalAmount == null ? null : finalAmount,
    "infoProduct": infoProduct == null ? null : infoProduct!.toJson(),
  };
}

class InfoProduct {
  InfoProduct({
    this.id,
    this.courseId,
    this.duration,
    this.retailPrice,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.course,

  });

  int? id;
  int? courseId;
  int? duration;
  int? retailPrice;
  int? discountPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Course? course;


  factory InfoProduct.fromJson(Map<String, dynamic> json) => InfoProduct(
    id: json["id"] == null ? null : json["id"],
    courseId: json["courseId"] == null ? null : json["courseId"],
    duration: json["duration"] == null ? null : json["duration"],
    retailPrice: json["retailPrice"] == null ? null : json["retailPrice"],
    discountPrice: json["discountPrice"] == null ? null : json["discountPrice"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    course: json["course"] == null ? null : Course.fromJson(json["course"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "courseId": courseId == null ? null : courseId,
    "duration": duration == null ? null : duration,
    "retailPrice": retailPrice == null ? null : retailPrice,
    "discountPrice": discountPrice == null ? null : discountPrice,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
    "course": course == null ? null : course!.toJson(),
  };
}

class Course {
  Course({
    this.introVideo,
    this.avatar,
    this.id,
    this.gradeId,
    this.teacherId,
    this.title,
    this.slug,
    this.partnerUnit,
    this.briefDescription,
    this.description,
    this.benefit,
    this.requirement,
    this.status,
    this.defaultExerciseId,
    this.isFree,
    this.isHighlight,
    this.purchaseCount,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? introVideo;
  String? avatar;
  int? id;
  int? gradeId;
  String? teacherId;
  String? title;
  String? slug;
  String? partnerUnit;
  String? briefDescription;
  String? description;
  String? benefit;
  String? requirement;
  String? status;
  dynamic defaultExerciseId;
  bool? isFree;
  bool? isHighlight;
  int? purchaseCount;
  bool? isHidden;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    introVideo: json["introVideo"] == null ? null : json["introVideo"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    id: json["id"] == null ? null : json["id"],
    gradeId: json["gradeId"] == null ? null : json["gradeId"],
    teacherId: json["teacherId"] == null ? null : json["teacherId"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    partnerUnit: json["partnerUnit"] == null ? null : json["partnerUnit"],
    briefDescription: json["briefDescription"] == null ? null : json["briefDescription"],
    description: json["description"] == null ? null : json["description"],
    benefit: json["benefit"] == null ? null : json["benefit"],
    requirement: json["requirement"] == null ? null : json["requirement"],
    status: json["status"] == null ? null : json["status"],
    defaultExerciseId: json["defaultExerciseId"],
    isFree: json["isFree"] == null ? null : json["isFree"],
    isHighlight: json["isHighlight"] == null ? null : json["isHighlight"],
    purchaseCount: json["purchaseCount"] == null ? null : json["purchaseCount"],
    isHidden: json["isHidden"] == null ? null : json["isHidden"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "introVideo": introVideo == null ? null : introVideo,
    "avatar": avatar == null ? null : avatar,
    "id": id == null ? null : id,
    "gradeId": gradeId == null ? null : gradeId,
    "teacherId": teacherId == null ? null : teacherId,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "partnerUnit": partnerUnit == null ? null : partnerUnit,
    "briefDescription": briefDescription == null ? null : briefDescription,
    "description": description == null ? null : description,
    "benefit": benefit == null ? null : benefit,
    "requirement": requirement == null ? null : requirement,
    "status": status == null ? null : status,
    "defaultExerciseId": defaultExerciseId,
    "isFree": isFree == null ? null : isFree,
    "isHighlight": isHighlight == null ? null : isHighlight,
    "purchaseCount": purchaseCount == null ? null : purchaseCount,
    "isHidden": isHidden == null ? null : isHidden,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class Payment {
  Payment({
    this.paymentMethod,
  });

  String? paymentMethod;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod == null ? null : paymentMethod,
  };
}
