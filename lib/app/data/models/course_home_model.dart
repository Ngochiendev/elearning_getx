// To parse this JSON data, do
//
//     final bookProgress = bookProgressFromJson(jsonString);

import 'dart:convert';

BookProgress bookProgressFromJson(String str) =>
    BookProgress.fromJson(json.decode(str));

String bookProgressToJson(BookProgress data) => json.encode(data.toJson());

class BookProgress {
  BookProgress({
    this.message,
    this.data,
  });

  final String? message;
  final DataHomeCourse? data;

  factory BookProgress.fromJson(Map<String, dynamic> json) => BookProgress(
        message: json["message"] == null ? null : json["message"],
        data:
            json["data"] == null ? null : DataHomeCourse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DataHomeCourse {
  DataHomeCourse({
    this.banners,
    this.courses,
    this.news,
    this.newsCategoryIsOnHome,
  });

  final Banners? banners;
  final Courses? courses;
  final List<News>? news;
  final NewsCategoryIsOnHome? newsCategoryIsOnHome;

  factory DataHomeCourse.fromJson(Map<String, dynamic> json) => DataHomeCourse(
        banners:
            json["banners"] == null ? null : Banners.fromJson(json["banners"]),
        courses:
            json["courses"] == null ? null : Courses.fromJson(json["courses"]),
        news: json["news"] == null
            ? null
            : List<News>.from(json["news"].map((x) => News.fromJson(x))),
        newsCategoryIsOnHome: json["newsCategoryIsOnHome"] == null
            ? null
            : NewsCategoryIsOnHome.fromJson(json["newsCategoryIsOnHome"]),
      );

  Map<String, dynamic> toJson() => {
        "banners": banners == null ? null : banners!.toJson(),
        "courses": courses == null ? null : courses!.toJson(),
        "news": news == null
            ? null
            : List<dynamic>.from(news!.map((x) => x.toJson())),
        "newsCategoryIsOnHome": newsCategoryIsOnHome == null
            ? null
            : newsCategoryIsOnHome!.toJson(),
      };
}

class Banners {
  Banners({
    this.topBanners,
    this.middleBanners,
    this.appBanners,
    this.appSlides,
    this.leftBanner,
    this.rightBanner,
  });

  final List<AppBanner>? topBanners;
  final List<AppBanner>? middleBanners;
  final List<AppBanner>? appBanners;
  final List<AppBanner>? appSlides;
  final List<AppBanner>? leftBanner;
  final List<AppBanner>? rightBanner;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        topBanners: json["topBanners"] == null
            ? null
            : List<AppBanner>.from(
                json["topBanners"].map((x) => AppBanner.fromJson(x))),
        middleBanners: json["middleBanners"] == null
            ? null
            : List<AppBanner>.from(
                json["middleBanners"].map((x) => AppBanner.fromJson(x))),
        appBanners: json["appBanners"] == null
            ? null
            : List<AppBanner>.from(
                json["appBanners"].map((x) => AppBanner.fromJson(x))),
        appSlides: json["appSlides"] == null
            ? null
            : List<AppBanner>.from(
                json["appSlides"].map((x) => AppBanner.fromJson(x))),
        leftBanner: json["leftBanner"] == null
            ? null
            : List<AppBanner>.from(
                json["leftBanner"].map((x) => AppBanner.fromJson(x))),
        rightBanner: json["rightBanner"] == null
            ? null
            : List<AppBanner>.from(
                json["rightBanner"].map((x) => AppBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topBanners": topBanners == null
            ? null
            : List<dynamic>.from(topBanners!.map((x) => x.toJson())),
        "middleBanners": middleBanners == null
            ? null
            : List<dynamic>.from(middleBanners!.map((x) => x.toJson())),
        "appBanners": appBanners == null
            ? null
            : List<dynamic>.from(appBanners!.map((x) => x.toJson())),
        "appSlides": appSlides == null
            ? null
            : List<dynamic>.from(appSlides!.map((x) => x.toJson())),
        "leftBanner": leftBanner == null
            ? null
            : List<dynamic>.from(leftBanner!.map((x) => x.toJson())),
        "rightBanner": rightBanner == null
            ? null
            : List<dynamic>.from(rightBanner!.map((x) => x.toJson())),
      };
}

class AppBanner {
  AppBanner({
    this.source,
    this.id,
    this.title,
    this.linkDirect,
    this.position,
    this.orderId,
    this.isActive,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  final String? source;
  final int? id;
  final String? title;
  final String? linkDirect;
  final String? position;
  final int? orderId;
  final bool? isActive;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory AppBanner.fromJson(Map<String, dynamic> json) => AppBanner(
        source: json["source"] == null ? null : json["source"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        linkDirect: json["linkDirect"] == null ? null : json["linkDirect"],
        position: json["position"] == null ? null : json["position"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source == null ? null : source,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "linkDirect": linkDirect == null ? null : linkDirect,
        "position": position == null ? null : position,
        "orderId": orderId == null ? null : orderId,
        "isActive": isActive == null ? null : isActive,
        "type": type == null ? null : type,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Courses {
  Courses({
    this.highLightCourses,
    this.discountCourses,
    this.newestCourses,
    this.freeCourses,
  });

  final List<CourseHome>? highLightCourses;
  final List<CourseHome>? discountCourses;
  final List<CourseHome>? newestCourses;
  final List<CourseHome>? freeCourses;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        highLightCourses: json["highLightCourses"] == null
            ? null
            : List<CourseHome>.from(
                json["highLightCourses"].map((x) => CourseHome.fromJson(x))),
        discountCourses: json["discountCourses"] == null
            ? null
            : List<CourseHome>.from(
                json["discountCourses"].map((x) => CourseHome.fromJson(x))),
        newestCourses: json["newestCourses"] == null
            ? null
            : List<CourseHome>.from(
                json["newestCourses"].map((x) => CourseHome.fromJson(x))),
        freeCourses: json["freeCourses"] == null
            ? null
            : List<CourseHome>.from(
                json["freeCourses"].map((x) => CourseHome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "highLightCourses": highLightCourses == null
            ? null
            : List<dynamic>.from(highLightCourses!.map((x) => x.toJson())),
        "discountCourses": discountCourses == null
            ? null
            : List<dynamic>.from(discountCourses!.map((x) => x.toJson())),
        "newestCourses": newestCourses == null
            ? null
            : List<dynamic>.from(newestCourses!.map((x) => x.toJson())),
        "freeCourses": freeCourses == null
            ? null
            : List<dynamic>.from(freeCourses!.map((x) => x.toJson())),
      };
}

class CourseHome {
  CourseHome({
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
    this.isAllowTrial,
    this.totalSessions,
    this.totalVideos,
    this.retailPrice,
    this.discountPrice,
    this.price,
    this.discountPercentage,
    this.purchasePackages,
    this.teacher,
    this.isAlreadyPurchased,
  });

  final String? introVideo;
  final String? avatar;
  final int? id;
  final int? gradeId;
  final String? teacherId;
  final String? title;
  final String? slug;
  final String? partnerUnit;
  final String? briefDescription;
  final String? description;
  final String? benefit;
  final String? requirement;
  final String? status;
  final int? defaultExerciseId;
  final bool? isFree;
  final bool? isHighlight;
  final int? purchaseCount;
  final bool? isHidden;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? isAllowTrial;
  final int? totalSessions;
  final int? totalVideos;
  final int? retailPrice;
  final int? discountPrice;
  final int? price;
  final int? discountPercentage;
  final int? isAlreadyPurchased;
  final List<PurchasePackage>? purchasePackages;
  final Teacher? teacher;

  factory CourseHome.fromJson(Map<String, dynamic> json) => CourseHome(
        introVideo: json["introVideo"] == null ? null : json["introVideo"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        id: json["id"] == null ? null : json["id"],
        gradeId: json["gradeId"] == null ? null : json["gradeId"],
        teacherId: json["teacherId"] == null ? null : json["teacherId"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        partnerUnit: json["partnerUnit"] == null ? null : json["partnerUnit"],
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
        deletedAt: json["deletedAt"],
        isAllowTrial:
            json["isAllowTrial"] == null ? null : json["isAllowTrial"],
        totalSessions:
            json["totalSessions"] == null ? null : json["totalSessions"],
        totalVideos: json["totalVideos"] == null ? null : json["totalVideos"],
        retailPrice: json["retailPrice"] == null
            ? 0
            : int.parse(json["retailPrice"].toString()),
        discountPrice: json["discountPrice"] == null
            ? 0
            : int.parse(json["discountPrice"].toString()),
        price: json["price"] == null ? 0 : int.parse(json["price"].toString()),
        discountPercentage: json["discountPercentage"] == null
            ? null
            : json["discountPercentage"],
        isAlreadyPurchased: json["isAlreadyPurchased"] == null
            ? 0
            : int.parse(json["isAlreadyPurchased"].toString()),
        purchasePackages: json["purchasePackages"] == null
            ? null
            : List<PurchasePackage>.from(json["purchasePackages"]
                .map((x) => PurchasePackage.fromJson(x))),
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
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
        "defaultExerciseId":
            defaultExerciseId == null ? null : defaultExerciseId,
        "isFree": isFree == null ? null : isFree,
        "isHighlight": isHighlight == null ? null : isHighlight,
        "purchaseCount": purchaseCount == null ? null : purchaseCount,
        "isHidden": isHidden == null ? null : isHidden,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "isAllowTrial": isAllowTrial == null ? null : isAllowTrial,
        "totalSessions": totalSessions == null ? null : totalSessions,
        "totalVideos": totalVideos == null ? null : totalVideos,
        "retailPrice": retailPrice == null ? null : retailPrice,
        "discountPrice": discountPrice == null ? null : discountPrice,
        "price": price == null ? null : price,
        "discountPercentage":
            discountPercentage == null ? null : discountPercentage,
        "purchasePackages": purchasePackages == null
            ? null
            : List<dynamic>.from(purchasePackages!.map((x) => x.toJson())),
        "teacher": teacher == null ? null : teacher!.toJson(),
      };
}

class PurchasePackage {
  PurchasePackage({
    this.id,
    this.courseId,
    this.duration,
    this.retailPrice,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final int? id;
  final int? courseId;
  final int? duration;
  final int? retailPrice;
  final int? discountPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory PurchasePackage.fromJson(Map<String, dynamic> json) =>
      PurchasePackage(
        id: json["id"] == null ? null : json["id"],
        courseId: json["courseId"] == null ? null : json["courseId"],
        duration: json["duration"] == null ? null : json["duration"],
        retailPrice: json["retailPrice"] == null ? null : json["retailPrice"],
        discountPrice:
            json["discountPrice"] == null ? null : json["discountPrice"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
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
      };
}

class Teacher {
  Teacher({
    this.firstName,
    this.attributes,
    this.email,
  });

  final String? firstName;
  final Attributes? attributes;
  final String? email;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        firstName: json["first_name"] == null ? null : json["first_name"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null ? null : firstName,
        "attributes": attributes == null ? null : attributes!.toJson(),
        "email": email == null ? null : email,
      };
}

class Attributes {
  Attributes({
    this.isLocked,
    this.idAccount,
    this.dateOfBirth,
    this.registerVerificationToken,
    this.introduce,
    this.sex,
    this.introduceVideo,
    this.avatar,
    this.activedAt,
  });

  final int? isLocked;
  final String? idAccount;
  final String? dateOfBirth;
  final String? registerVerificationToken;
  final String? introduce;
  final String? sex;
  final String? introduceVideo;
  final String? avatar;
  final String? activedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        isLocked: json["is_locked"] == null ? null : json["is_locked"],
        idAccount: json["id_account"] == null ? null : json["id_account"],
        // dateOfBirth:
        //     json["date_of_birth"] == null ? null : json["date_of_birth"],
        registerVerificationToken: json["register_verification_token"] == null
            ? null
            : json["register_verification_token"],
        introduce: json["introduce"] == null ? null : json["introduce"],
        // sex: json["sex"] == null ? null : json["sex"],
        introduceVideo:
            json["introduce_video"] == null ? null : json["introduce_video"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        activedAt: json["actived_at"] == null ? null : json["actived_at"],
      );

  Map<String, dynamic> toJson() => {
        "is_locked": isLocked == null ? null : isLocked,
        "id_account": idAccount == null ? null : idAccount,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "register_verification_token": registerVerificationToken == null
            ? null
            : registerVerificationToken,
        "introduce": introduce == null ? null : introduce,
        "sex": sex == null ? null : sex,
        "introduce_video": introduceVideo == null ? null : introduceVideo,
        "avatar": avatar == null ? null : avatar,
        "actived_at": activedAt == null ? null : activedAt,
      };
}

class News {
  News({
    this.thumbnail,
    this.id,
    this.categoryId,
    this.title,
    this.content,
    this.summary,
    this.author,
    this.slug,
    this.isPublic,
    this.view,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  final String? thumbnail;
  final int? id;
  final int? categoryId;
  final String? title;
  final String? content;
  final String? summary;
  final String? author;
  final String? slug;
  final bool? isPublic;
  final int? view;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory News.fromJson(Map<String, dynamic> json) => News(
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        id: json["id"] == null ? null : json["id"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        summary: json["summary"] == null ? null : json["summary"],
        author: json["author"] == null ? null : json["author"],
        slug: json["slug"] == null ? null : json["slug"],
        isPublic: json["isPublic"] == null ? null : json["isPublic"],
        view: json["view"] == null ? null : json["view"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail == null ? null : thumbnail,
        "id": id == null ? null : id,
        "categoryId": categoryId == null ? null : categoryId,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "summary": summary == null ? null : summary,
        "author": author == null ? null : author,
        "slug": slug == null ? null : slug,
        "isPublic": isPublic == null ? null : isPublic,
        "view": view == null ? null : view,
        "type": type == null ? null : type,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class NewsCategoryIsOnHome {
  NewsCategoryIsOnHome({
    this.newsCategory,
    this.newsCates,
  });

  final NewsCategory? newsCategory;
  final List<News>? newsCates;

  factory NewsCategoryIsOnHome.fromJson(Map<String, dynamic> json) =>
      NewsCategoryIsOnHome(
        newsCategory: json["newsCategory"] == null
            ? null
            : NewsCategory.fromJson(json["newsCategory"]),
        newsCates: json["newsCates"] == null
            ? null
            : List<News>.from(json["newsCates"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "newsCategory": newsCategory == null ? null : newsCategory!.toJson(),
        "newsCates": newsCates == null
            ? null
            : List<dynamic>.from(newsCates!.map((x) => x.toJson())),
      };
}

class NewsCategory {
  NewsCategory({
    this.id,
    this.name,
    this.isHomeDisplayed,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final bool? isHomeDisplayed;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory NewsCategory.fromJson(Map<String, dynamic> json) => NewsCategory(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        isHomeDisplayed:
            json["isHomeDisplayed"] == null ? null : json["isHomeDisplayed"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "isHomeDisplayed": isHomeDisplayed == null ? null : isHomeDisplayed,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
