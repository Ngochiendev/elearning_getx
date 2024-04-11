// To parse this JSON data, do
//
//     final userBookHistory = userBookHistoryFromJson(jsonString);

import 'dart:convert';

UserBookHistory userBookHistoryFromJson(String str) => UserBookHistory.fromJson(json.decode(str));

String userBookHistoryToJson(UserBookHistory data) => json.encode(data.toJson());

class UserBookHistory {
  UserBookHistory({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory UserBookHistory.fromJson(Map<String, dynamic> json) => UserBookHistory(
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
    this.orders,
    this.pagination,
  });

  List<OrderBook>? orders;
  Pagination? pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orders: json["orders"] == null ? null : List<OrderBook>.from(json["orders"].map((x) => OrderBook.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x.toJson())),
    "pagination": pagination == null ? null : pagination!.toJson(),
  };
}

class OrderBook {
  OrderBook({
    this.id,
    this.merchantCode,
    this.orderDate,
    this.orderExpiredDate,
    this.customerId,
    this.orderItemss,
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
  List<OrderItemss>? orderItemss;
  String? orderStatus;
  Payment? payment;
  List<dynamic>? couponIds;
  String? productSource;
  int? totalPrice;
  int? totalDiscount;
  int? taxPercent;
  int? totalTax;
  int? finalAmount;
  List<dynamic>? couponCode;
  List<dynamic>? comboDiscount;

  factory OrderBook.fromJson(Map<String, dynamic> json) => OrderBook(
    id: json["id"] == null ? null : json["id"],
    merchantCode: json["merchant_code"] == null ? null : json["merchant_code"],
    orderDate: json["order_date"] == null ? null : json["order_date"].toDouble(),
    orderExpiredDate: json["order_expired_date"] == null ? null : json["order_expired_date"].toDouble(),
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    orderItemss: json["order_items"] == null ? null : List<OrderItemss>.from(json["order_items"].map((x) => OrderItemss.fromJson(x))),
    orderStatus: json["order_status"] == null ? null : json["order_status"],
    payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
    couponIds: json["coupon_ids"] == null ? null : List<dynamic>.from(json["coupon_ids"].map((x) => x)),
    productSource: json["product_source"] == null ? null : json["product_source"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    totalDiscount: json["total_discount"] == null ? null : json["total_discount"],
    taxPercent: json["tax_percent"] == null ? null : json["tax_percent"],
    totalTax: json["total_tax"] == null ? null : json["total_tax"],
    finalAmount: json["final_amount"] == null ? null : json["final_amount"],
    couponCode: json["couponCode"] == null ? null : List<dynamic>.from(json["couponCode"].map((x) => x)),
    comboDiscount: json["comboDiscount"] == null ? null : List<dynamic>.from(json["comboDiscount"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "merchant_code": merchantCode == null ? null : merchantCode,
    "order_date": orderDate == null ? null : orderDate,
    "order_expired_date": orderExpiredDate == null ? null : orderExpiredDate,
    "customer_id": customerId == null ? null : customerId,
    "order_items": orderItemss == null ? null : List<dynamic>.from(orderItemss!.map((x) => x.toJson())),
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
    "comboDiscount": comboDiscount == null ? null : List<dynamic>.from(comboDiscount!.map((x) => x)),
  };
}

class OrderItemss {
  OrderItemss({
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

  factory OrderItemss.fromJson(Map<String, dynamic> json) => OrderItemss(
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
    this.bookId,
    this.duration,
    this.retailPrice,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.book,
  });

  int? id;
  int? bookId;
  int? duration;
  int? retailPrice;
  int? discountPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  Book? book;

  factory InfoProduct.fromJson(Map<String, dynamic> json) => InfoProduct(
    id: json["id"] == null ? null : json["id"],
    bookId: json["bookId"] == null ? null : json["bookId"],
    duration: json["duration"] == null ? null : json["duration"],
    retailPrice: json["retailPrice"] == null ? null : json["retailPrice"],
    discountPrice: json["discountPrice"] == null ? null : json["discountPrice"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    book: json["book"] == null ? null : Book.fromJson(json["book"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "bookId": bookId == null ? null : bookId,
    "duration": duration == null ? null : duration,
    "retailPrice": retailPrice == null ? null : retailPrice,
    "discountPrice": discountPrice == null ? null : discountPrice,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
    "book": book == null ? null : book!.toJson(),
  };
}

class Book {
  Book({
    this.cover,
    this.tableOfContentImage,
    this.freePdf,
    this.background,
    this.id,
    this.title,
    this.slug,
    this.ownerId,
    this.briefDescription,
    this.description,
    this.isFree,
    this.status,
    this.orderId,
    this.tableOfContentIsPicture,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? cover;
  dynamic? tableOfContentImage;
  String? freePdf;
  String? background;
  int? id;
  String? title;
  String? slug;
  String? ownerId;
  String? briefDescription;
  String? description;
  bool? isFree;
  String? status;
  int? orderId;
  bool? tableOfContentIsPicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    cover: json["cover"] == null ? null : json["cover"],
    tableOfContentImage: json["tableOfContentImage"],
    freePdf: json["freePdf"] == null ? null : json["freePdf"],
    background: json["background"] == null ? null : json["background"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    ownerId: json["ownerId"] == null ? null : json["ownerId"],
    briefDescription: json["briefDescription"] == null ? null : json["briefDescription"],
    description: json["description"] == null ? null : json["description"],
    isFree: json["isFree"] == null ? null : json["isFree"],
    status: json["status"] == null ? null : json["status"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    tableOfContentIsPicture: json["tableOfContentIsPicture"] == null ? null : json["tableOfContentIsPicture"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "cover": cover == null ? null : cover,
    "tableOfContentImage": tableOfContentImage,
    "freePdf": freePdf == null ? null : freePdf,
    "background": background == null ? null : background,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "ownerId": ownerId == null ? null : ownerId,
    "briefDescription": briefDescription == null ? null : briefDescription,
    "description": description == null ? null : description,
    "isFree": isFree == null ? null : isFree,
    "status": status == null ? null : status,
    "orderId": orderId == null ? null : orderId,
    "tableOfContentIsPicture": tableOfContentIsPicture == null ? null : tableOfContentIsPicture,
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
