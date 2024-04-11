import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/chapters_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/data/models/trial_chapters_model.dart';

class Course {
  int? id;
  String? introVideo;
  String? avatar;
  int? gradeId;
  String? teacherId;
  String? title;
  String? slug;
  String? briefDescription;
  String? description;
  String? benefit;
  String? requirement;
  String? status;
  bool? isFree;
  bool? isHighlight;
  int? purchaseCount;
  bool? isHidden;
  String? createdAt;
  String? updatedAt;
  int? isAllowTrial;
  int? totalSessions;
  int? totalVideos;
  int? retailPrice;
  int? discountPrice;
  int? price;
  int? discountPercentage;
  int? isAlreadyPurchased;
  Teacher? teacher;
  String? ratingAvg;
  String? totalRating;
  List<PurchasePackagesModel>? purchasePackages;
  List<CategoryCourse>? categories;
  List<ChaptersModel>? chapters;
  List<TrialChapters>? trialChapters;
  Course(
      {this.id,
      this.introVideo,
      this.avatar,
      this.gradeId,
      this.teacherId,
      this.title,
      this.slug,
      this.briefDescription,
      this.description,
      this.benefit,
      this.requirement,
      this.status,
      this.isFree,
      this.isHighlight,
      this.purchaseCount,
      this.isHidden,
      this.createdAt,
      this.updatedAt,
      this.isAllowTrial,
      this.totalSessions,
      this.totalVideos,
      this.retailPrice,
      this.discountPrice,
      this.price,
      this.discountPercentage,
      this.teacher,
      this.purchasePackages,
      this.categories,
      this.chapters,
      this.isAlreadyPurchased,
      this.ratingAvg,
      this.totalRating,
      this.trialChapters});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    introVideo = json['introVideo'];
    avatar = json['avatar'];
    gradeId = json['gradeId'];
    teacherId = json['teacherId'];
    title = json['title'];
    slug = json['slug'];
    briefDescription = json['briefDescription'];
    description = json['description'];
    requirement = json['requirement'];
    benefit = json['benefit'];
    ratingAvg = json['ratingAvg'] == null ? "0" : json['ratingAvg'].toString();
    totalRating =
        json['totalRating'] == null ? "0" : json['totalRating'].toString();
    isHighlight = json['isHighlight'];
    purchaseCount = json['purchaseCount'];
    isHidden = json['isHidden'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isAllowTrial = json['isAllowTrial'];
    totalSessions = json['totalSessions'];
    totalVideos = json['totalVideos'];
    retailPrice = json['retailPrice'] == null
        ? 0
        : int.parse(json['retailPrice'].toString());
    discountPrice = json['discountPrice'] == null
        ? 0
        : int.parse(json['discountPrice'].toString());
    price = json['price'];
    isFree = json['isFree'];
    isAlreadyPurchased =
        json['isAlreadyPurchased'] == null ? null : json['isAlreadyPurchased'];
    discountPercentage = json['discountPercentage'];
    teacher =
        json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]);
    if (json['purchasePackages'] != null) {
      purchasePackages = <PurchasePackagesModel>[];
      json['purchasePackages'].forEach((v) {
        purchasePackages!
            .add(PurchasePackagesModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['categories'] != null) {
      categories = <CategoryCourse>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryCourse.fromJson(Map<String, dynamic>.from(v)));
      });
    }

    if (json['chapters'] != null) {
      chapters = <ChaptersModel>[];
      json['chapters'].forEach((v) {
        chapters!.add(ChaptersModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }

    if (json['trialChapters'] != null) {
      trialChapters = <TrialChapters>[];
      json['trialChapters'].forEach((v) {
        trialChapters!
            .add(TrialChapters.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['introVideo'] = introVideo;
    data['avatar'] = avatar;
    data['gradeId'] = gradeId;
    data['teacherId'] = teacherId;
    data['title'] = title;
    data['slug'] = slug;
    data['isFree'] = isFree;
    data['totalRating'] = totalRating;
    data['briefDescription'] = briefDescription;
    data['requirement'] = requirement;
    data['description'] = description;
    data['benefit'] = benefit;
    data['isHighlight'] = isHighlight;
    data['purchaseCount'] = purchaseCount;
    data['isHidden'] = isHidden;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isAllowTrial'] = isAllowTrial;
    data['totalSessions'] = totalSessions;
    data['ratingAvg'] = ratingAvg;
    data['totalVideos'] = totalVideos;
    data['retailPrice'] = retailPrice;
    data['discountPrice'] = discountPrice;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['teacher'] = teacher == null ? null : teacher!.toJson();
    if (purchasePackages != null) {
      data['purchasePackages'] =
          purchasePackages!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (chapters != null) {
      data['chapters'] = chapters!.map((v) => v.toJson()).toList();
    }
    if (trialChapters != null) {
      data['trialChapters'] = trialChapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teacher {
  Teacher({
    this.id,
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
    this.active,
  });

  String? id;
  String? merchantCode;
  String? username;
  String? firstName;
  String? phone;
  String? email;
  String? attributeSetId;
  List<Role>? roles;
  Attributes? attributes;
  double? createAt;
  double? updateAt;
  bool? active;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        username: json["username"] == null ? null : json["username"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        attributeSetId:
            json["attribute_set_id"] == null ? null : json["attribute_set_id"],
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        createAt:
            json["create_at"] == null ? null : json["create_at"].toDouble(),
        updateAt:
            json["update_at"] == null ? null : json["update_at"].toDouble(),
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "username": username == null ? null : username,
        "first_name": firstName == null ? null : firstName,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "attribute_set_id": attributeSetId == null ? null : attributeSetId,
        "roles": roles == null
            ? null
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "attributes": attributes == null ? null : attributes!.toJson(),
        "create_at": createAt == null ? null : createAt,
        "update_at": updateAt == null ? null : updateAt,
        "active": active == null ? null : active,
      };
}

class Role {
  Role({
    this.id,
    this.merchantCode,
    this.name,
  });

  String? id;
  String? merchantCode;
  String? name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "name": name == null ? null : name,
      };
}

class Attributes {
  Attributes({
    this.isLocked,
    this.registerVerificationToken,
    this.introduce,
    this.introduceVideo,
    this.avatar,
    this.activedAt,
  });

  int? isLocked;
  String? registerVerificationToken;
  String? introduce;

  String? introduceVideo;
  String? avatar;
  String? activedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        isLocked: json["is_locked"] == null ? null : json["is_locked"],
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        introduce: json["introduce"] == null ? null : json["introduce"],
        introduceVideo:
            json["introduce_video"] == null ? null : json["introduce_video"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        activedAt: json["actived_at"] == null ? null : json["actived_at"],
      );

  Map<String, dynamic> toJson() => {
        "is_locked": isLocked == null ? null : isLocked,
        "register_verification_token": registerVerificationToken == null
            ? null
            : registerVerificationToken,
        "introduce": introduce == null ? null : introduce,
        "introduce_video": introduceVideo == null ? null : introduceVideo,
        "avatar": avatar == null ? null : avatar,
        "actived_at": activedAt == null ? null : activedAt,
      };
}
