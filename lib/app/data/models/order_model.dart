// To parse this JSON data, do
//
//     final orderHistory = orderHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:elearning/app/data/models/book_models/book_history_model.dart';

OrderHistory orderHistoryFromJson(String str) =>
    OrderHistory.fromJson(json.decode(str));

String orderHistoryToJson(OrderHistory data) => json.encode(data.toJson());

class OrderHistory {
  OrderHistory({
    this.message,
    this.data,
  });

  String? message;
  DataOrder? data;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataOrder.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataOrder {
  DataOrder({
    this.orders,
    this.pagination,
  });

  List<Order>? orders;
  Pagination? pagination;

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        orders: json["orders"] == null
            ? null
            : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders == null
            ? null
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination!.toJson(),
      };
}

class Order {
  Order({
    this.id,
    this.merchantCode,
    this.orderDate,
    this.customerId,
    this.orderItems,
    this.orderStatus,
    this.payment,
    this.totalPrice,
    this.totalDiscount,
    this.taxPercent,
    this.totalTax,
    this.finalAmount,
  });

  String? id;
  String? merchantCode;
  double? orderDate;
  String? customerId;
  List<OrderItem>? orderItems;
  String? orderStatus;
  Payment? payment;
  int? totalPrice;
  int? totalDiscount;
  int? taxPercent;
  int? totalTax;
  int? finalAmount;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        orderDate:
            json["order_date"] == null ? null : json["order_date"].toDouble(),
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        orderItems: json["order_items"] == null
            ? null
            : List<OrderItem>.from(
                json["order_items"].map((x) => OrderItem.fromJson(x))),
        orderStatus: json["order_status"] == null ? null : json["order_status"],
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        totalDiscount:
            json["total_discount"] == null ? null : json["total_discount"],
        taxPercent: json["tax_percent"] == null ? null : json["tax_percent"],
        totalTax: json["total_tax"] == null ? null : json["total_tax"],
        finalAmount: json["final_amount"] == null ? null : json["final_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "order_date": orderDate == null ? null : orderDate,
        "customer_id": customerId == null ? null : customerId,
        "order_items": orderItems == null
            ? null
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
        "order_status": orderStatus == null ? null : orderStatus,
        "payment": payment == null ? null : payment!.toJson(),
        "total_price": totalPrice == null ? null : totalPrice,
        "total_discount": totalDiscount == null ? null : totalDiscount,
        "tax_percent": taxPercent == null ? null : taxPercent,
        "total_tax": totalTax == null ? null : totalTax,
        "final_amount": finalAmount == null ? null : finalAmount,
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
    this.inforProduct,
  });

  String? id;
  String? productId;
  int? quantity;
  int? unitPrice;
  int? totalPrice;
  int? unitDiscount;
  int? totalDiscount;
  int? finalAmount;
  InforProduct? inforProduct;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        unitPrice: json["unit_price"] == null ? null : json["unit_price"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        unitDiscount:
            json["unit_discount"] == null ? null : json["unit_discount"],
        totalDiscount:
            json["total_discount"] == null ? null : json["total_discount"],
        finalAmount: json["final_amount"] == null ? null : json["final_amount"],
        inforProduct: json["infoProduct"] == null
            ? null
            : InforProduct.fromJson(json["infoProduct"]),
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
        "inforProduct": inforProduct == null ? null : inforProduct!.toJson(),
      };
}

class InforProduct {
  InforProduct({
    this.id,
    this.courseId,
    this.duration,
    this.retailPrice,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
    this.course,
    this.book
  });

  int? id;
  int? courseId;
  int? duration;
  int? retailPrice;
  int? discountPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  Course? course;
  Book? book;

  factory InforProduct.fromJson(Map<String, dynamic> json) => InforProduct(
        id: json["id"] == null ? null : json["id"],
        courseId: json["courseId"] == null ? null : json["courseId"],
        duration: json["duration"] == null ? null : json["duration"],
        retailPrice: json["retailPrice"] == null
            ? null
            : int.parse(json["retailPrice"].toString()),
        discountPrice: json["discountPrice"] == null
            ? null
            : int.parse(json["discountPrice"].toString()),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
        book: json["book"] == null ? null : Book.fromJson(json["book"]),
  );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "courseId": courseId == null ? null : courseId,
        "duration": duration == null ? null : duration,
        "retailPrice": retailPrice == null ? null : retailPrice,
        "discountPrice": discountPrice == null ? null : discountPrice,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
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
  });

  String? introVideo;
  String? avatar;
  int? id;
  int? gradeId;
  String? teacherId;
  String? title;
  String? slug;
  String? briefDescription;
  String? description;
  String? benefit;
  String? requirement;
  String? status;
  int? defaultExerciseId;
  bool? isFree;
  bool? isHighlight;
  int? purchaseCount;
  bool? isHidden;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        introVideo: json["introVideo"] == null ? null : json["introVideo"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        id: json["id"] == null ? null : json["id"],
        gradeId: json["gradeId"] == null ? null : json["gradeId"],
        teacherId: json["teacherId"] == null ? null : json["teacherId"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        briefDescription:
            json["briefDescription"] == null ? null : json["briefDescription"],
        description: json["description"] == null ? null : json["description"],
        benefit: json["benefit"] == null ? null : json["benefit"],
        requirement: json["requirement"] == null ? null : json["requirement"],
        status: json["status"] == null ? null : json["status"],
        defaultExerciseId: json["defaultExerciseId"] == null
            ? null
            : json["defaultExerciseId"],
        isFree: json["isFree"] == null ? null : json["isFree"],
        isHighlight: json["isHighlight"] == null ? null : json["isHighlight"],
        purchaseCount:
            json["purchaseCount"] == null ? null : json["purchaseCount"],
        isHidden: json["isHidden"] == null ? null : json["isHidden"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "introVideo": introVideo == null ? null : introVideo,
        "avatar": avatar == null ? null : avatar,
        "id": id == null ? null : id,
        "gradeId": gradeId == null ? null : gradeId,
        "teacherId": teacherId == null ? null : teacherId,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "briefDescription": briefDescription == null ? null : briefDescription,
        "description": description == null ? null : description,
        "benefit": benefit == null ? null : benefit,
        "requirement": requirement == null ? null : requirement,
        "status": status == null ? null : status,
        "defaultExerciseId":
            defaultExerciseId == null ? null : defaultExerciseId,
        "isFree": isFree == null ? null : isFree,
        "isHighlight": isHighlight == null ? null : isHighlight,
        "purchaseCount": purchaseCount == null ? null : purchaseCount,
        "isHidden": isHidden == null ? null : isHidden,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Payment {
  Payment({
    this.paymentMethod,
    this.transactionId,
    this.status,
  });

  String? paymentMethod;
  String? transactionId;
  String? status;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentMethod:
            json["payment_method"] == null ? null : json["payment_method"],
        transactionId:
            json["transaction_id"] == null ? null : json["transaction_id"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "transaction_id": transactionId == null ? null : transactionId,
        "status": status == null ? null : status,
      };
}

class Pagination {
  Pagination({
    this.total,
    this.page,
    this.perPage,
  });

  int? total;
  int? page;
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
