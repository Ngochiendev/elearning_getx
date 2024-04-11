// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'package:logger/logger.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    Cart({
        this.message,
        this.data,
    });

    String? message;
    DataCart? data;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataCart.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class DataCart {
    DataCart({
        this.cart,
    });

    CartClass? cart;

    factory DataCart.fromJson(Map<String, dynamic> json) => DataCart(
        cart: json["cart"] == null ? null : CartClass.fromJson(json["cart"]),
    );

    Map<String, dynamic> toJson() => {
        "cart": cart == null ? null : cart!.toJson(),
    };
}

class CartClass {
    CartClass({
        this.cartItems,
        this.totalPrice,
        this.totalDiscountPrice,
        this.totalAmount,
        this.id,
        this.combo
    });

    List<CartItem>? cartItems;
    int? totalPrice;
    int? totalDiscountPrice;
    int? totalAmount;
    String? id;
    Combo? combo;

    factory CartClass.fromJson(Map<String, dynamic> json) => CartClass(
        cartItems: json["cartItems"] == null ? null : List<CartItem>.from(json["cartItems"].map((x) => CartItem.fromJson(x))),
        totalPrice: json["totalPrice"] == null ? null : json["totalPrice"].toInt(),
        totalDiscountPrice: json["totalDiscountPrice"] == null ? null : json["totalDiscountPrice"].toInt(),
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"].toInt(),
        id: json["id"] == null ? null : json["id"],
        combo: json["combo"] == null ? null : Combo.fromJson(json["combo"]),
    );

    Map<String, dynamic> toJson() => {
        "cartItems": cartItems == null ? null : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
        "totalPrice": totalPrice == null ? null : totalPrice,
        "totalDiscountPrice": totalDiscountPrice == null ? null : totalDiscountPrice,
        "totalAmount": totalAmount == null ? null : totalAmount,
        "id": id == null ? null : id,
         "combo": combo == null ? null : combo!.toJson(),
    };
}

class CartItem {
    CartItem({
        this.id,
        this.cartId,
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
    String? cartId;
    String? productId;
    int? quantity;
    int? unitPrice;
    int? totalPrice;
    int? unitDiscount;
    int? totalDiscount;
    int? finalAmount;
    InforProduct? inforProduct;

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"] == null ? null : json["id"],
        cartId: json["cart_id"] == null ? null : json["cart_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        unitPrice: json["unit_price"] == null ? null : json["unit_price"].toInt(),
        totalPrice: json["total_price"] == null ? null : json["total_price"].toInt(),
        unitDiscount: json["unit_discount"] == null ? null : json["unit_discount"].toInt(),
        totalDiscount: json["total_discount"] == null ? null : json["total_discount"].toInt(),
        finalAmount: json["final_amount"] == null ? null : json["final_amount"].toInt(),
        inforProduct: json["inforProduct"] == null ? null : InforProduct.fromJson(json["inforProduct"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cart_id": cartId == null ? null : cartId,
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
        this.purchasePackages,
    });

    String?cover;
    String?tableOfContentImage;
    dynamic freePdf;
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
    dynamic deletedAt;
    List<InforProduct>? purchasePackages;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        cover: json["cover"] == null ? null : json["cover"],
        tableOfContentImage: json["tableOfContentImage"] == null ? null : json["tableOfContentImage"],
        freePdf: json["freePdf"],
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
        purchasePackages: json["purchasePackages"] == null ? null : List<InforProduct>.from(json["purchasePackages"].map((x) => InforProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cover": cover == null ? null : cover,
        "tableOfContentImage": tableOfContentImage == null ? null : tableOfContentImage,
        "freePdf": freePdf,
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
        "purchasePackages": purchasePackages == null ? null : List<dynamic>.from(purchasePackages!.map((x) => x.toJson())),
    };
}

class InforProduct {
    InforProduct({
        this.id,
        this.bookId,
        this.duration,
        this.retailPrice,
        this.discountPrice,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.book,
        this.course,
        this.courseId,
    });

    int? id;
    int? bookId;
    int? courseId;
    int? duration;
    int? retailPrice;
    int? discountPrice;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    Book? book;
    Course? course;

    factory InforProduct.fromJson(Map<String, dynamic> json) => InforProduct(
        id: json["id"] == null ? null : json["id"],
        bookId: json["bookId"] == null ? null : json["bookId"],
        courseId: json["courseId"] == null ? null : json["courseId"],
        duration: json["duration"] == null ? null : json["duration"],
        retailPrice: json["retailPrice"] == null ? null : int.parse(json["retailPrice"].toString()),
        discountPrice: json["discountPrice"] == null ? null : int.parse(json["discountPrice"].toString()),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        book: json["book"] == null ? null : Book.fromJson(json["book"]),
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
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
        "course": course == null ? null : course!.toJson(),
    };
}
class Course {
  Course(
      {this.introVideo,
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
      this.purchasePackages,
      this.teacher});

  Course.fromJson(Map<String, dynamic> json) {
    introVideo = json['introVideo'];
    avatar = json['avatar'];
    id = json['id'];
    gradeId = json['gradeId'];
    teacherId = json['teacherId'];
    title = json['title'];
    slug = json['slug'];
    briefDescription = json['briefDescription'];
    description = json['description'];
    benefit = json['benefit'];
    requirement = json['requirement'];
    status = json['status'];
    defaultExerciseId = json['defaultExerciseId'];
    isFree = json['isFree'];
    isHighlight = json['isHighlight'];
    purchaseCount = json['purchaseCount'];
    isHidden = json['isHidden'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['purchasePackages'] != null) {
      purchasePackages = <InforProduct>[];
      json['purchasePackages'].forEach((v) {
        purchasePackages?.add(InforProduct.fromJson(v));
      });
    }
    teacher = json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
  }

  String? avatar;
  String? benefit;
  String? briefDescription;
  String? createdAt;
  int? defaultExerciseId;
  String? description;
  int? gradeId;
  int? id;
  String? introVideo;
  bool? isFree;
  bool? isHidden;
  bool? isHighlight;
  int? purchaseCount;
  List<InforProduct>? purchasePackages;
  String? requirement;
  String? slug;
  String? status;
  Teacher? teacher;
  String? teacherId;
  String? title;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['introVideo'] = introVideo;
    data['avatar'] = avatar;
    data['id'] = id;
    data['gradeId'] = gradeId;
    data['teacherId'] = teacherId;
    data['title'] = title;
    data['slug'] = slug;
    data['briefDescription'] = briefDescription;
    data['description'] = description;
    data['benefit'] = benefit;
    data['requirement'] = requirement;
    data['status'] = status;
    data['defaultExerciseId'] = defaultExerciseId;
    data['isFree'] = isFree;
    data['isHighlight'] = isHighlight;
    data['purchaseCount'] = purchaseCount;
    data['isHidden'] = isHidden;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (purchasePackages != null) {
      data['purchasePackages'] = purchasePackages?.map((v) => v.toJson()).toList();
    }
    if (teacher != null) {
      data['teacher'] = teacher?.toJson();
    }
    return data;
  }
}
class Teacher {
  Teacher(
      {this.id,
      this.merchantCode,
      this.username,
      this.firstName,
      this.phone,
      this.email,
      this.attributeSetId,
      this.roles,
      this.attributes,
      this.createAt,
      this.updateAt,
      this.active});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantCode = json['merchant_code'];
    username = json['username'];
    firstName = json['first_name'];
    phone = json['phone'];
    email = json['email'];
    attributeSetId = json['attribute_set_id'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
    attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
    createAt = json['create_at'];
    updateAt = json['update_at'].toDouble();
    active = json['active'];
  }

  bool? active;
  String? attributeSetId;
  Attributes? attributes;
  double? createAt;
  String? email;
  String? firstName;
  String? id;
  String? merchantCode;
  String? phone;
  List<Roles>? roles;
  double? updateAt;
  String? username;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_code'] = merchantCode;
    data['username'] = username;
    data['first_name'] = firstName;
    data['phone'] = phone;
    data['email'] = email;
    data['attribute_set_id'] = attributeSetId;
    if (roles != null) {
      data['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes?.toJson();
    }
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['active'] = active;
    return data;
  }
}

class Roles {
  Roles({this.id, this.merchantCode, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantCode = json['merchant_code'];
    name = json['name'];
  }

  String? id;
  String? merchantCode;
  String? name;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_code'] = merchantCode;
    data['name'] = name;
    return data;
  }
}

class Attributes {
  Attributes(
      {this.isLocked,
      this.dateOfBirth,
      this.registerVerificationToken,
      this.introduce,
      this.sex,
      this.introduceVideo,
      this.avatar,
      this.activedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    Logger().d(json);
    isLocked = json['is_locked'];
    dateOfBirth = '${json['date_of_birth']}';
    registerVerificationToken = json['register_verification_token'];
    introduce = json['introduce'];
    sex = '${json['sex']}';
    introduceVideo = json['introduce_video'];
    avatar = json['avatar'];
    activedAt = json['actived_at'];
  }

  String? activedAt;
  String? avatar;
  String? dateOfBirth;
  String? introduce;
  String? introduceVideo;
  int? isLocked;
  String? registerVerificationToken;
  String? sex;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['is_locked'] = isLocked;
    data['date_of_birth'] = dateOfBirth;
    data['register_verification_token'] = registerVerificationToken;
    data['introduce'] = introduce;
    data['sex'] = sex;
    data['introduce_video'] = introduceVideo;
    data['avatar'] = avatar;
    data['actived_at'] = activedAt;
    return data;
  }
}
class Combo {
    Combo({
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

    factory Combo.fromJson(Map<String, dynamic> json) => Combo(
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
