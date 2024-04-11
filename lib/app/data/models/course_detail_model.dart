// To parse this JSON data, do
//
//     final courseDetail = courseDetailFromJson(jsonString);

import 'dart:convert';

CourseDetail courseDetailFromJson(String str) => CourseDetail.fromJson(json.decode(str));

String courseDetailToJson(CourseDetail data) => json.encode(data.toJson());

class CourseDetail {
  CourseDetail({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
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
    this.course,
  });

  Course? course;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    course: json["course"] == null ? null : Course.fromJson(json["course"]),
  );

  Map<String, dynamic> toJson() => {
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
    this.ratingAvg,
    this.totalRating,
    this.isAlreadyPurchased,
    this.purchasePackages,
    this.teacher,
    this.categories,
    this.chapters,
    this.trialChapters,
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
  dynamic? defaultExerciseId;
  bool? isFree;
  bool? isHighlight;
  int? purchaseCount;
  bool? isHidden;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  dynamic? ratingAvg;
  int? totalRating;
  dynamic? isAlreadyPurchased;
  List<PurchasePackage>? purchasePackages;
  Teacher? teacher;
  List<Category>? categories;
  List<Chapter>? chapters;
  List<TrialChapter>? trialChapters;

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
    ratingAvg: json["ratingAvg"],
    totalRating: json["totalRating"] == null ? null : json["totalRating"],
    isAlreadyPurchased: json["isAlreadyPurchased"],
    purchasePackages: json["purchasePackages"] == null ? null : List<PurchasePackage>.from(json["purchasePackages"].map((x) => PurchasePackage.fromJson(x))),
    teacher: json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
    categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    chapters: json["chapters"] == null ? null : List<Chapter>.from(json["chapters"].map((x) => Chapter.fromJson(x))),
    trialChapters: json["trialChapters"] == null ? null : List<TrialChapter>.from(json["trialChapters"].map((x) => TrialChapter.fromJson(x))),
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
    "ratingAvg": ratingAvg,
    "totalRating": totalRating == null ? null : totalRating,
    "isAlreadyPurchased": isAlreadyPurchased,
    "purchasePackages": purchasePackages == null ? null : List<dynamic>.from(purchasePackages!.map((x) => x.toJson())),
    "teacher": teacher == null ? null : teacher!.toJson(),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "chapters": chapters == null ? null : List<dynamic>.from(chapters!.map((x) => x.toJson())),
    "trialChapters": trialChapters == null ? null : List<dynamic>.from(trialChapters!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.parentId,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic? parentId;
  String? name;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    parentId: json["parentId"],
    name: json["name"] == null ? null : json["name"],
    slug: json["slug"] == null ? null : json["slug"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "parentId": parentId,
    "name": name == null ? null : name,
    "slug": slug == null ? null : slug,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class Chapter {
  Chapter({
    this.id,
    this.courseId,
    this.parentId,
    this.title,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.sessions,
  });

  int? id;
  int? courseId;
  dynamic? parentId;
  String? title;
  int? orderId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  List<ChapterSession>? sessions;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["id"] == null ? null : json["id"],
    courseId: json["courseId"] == null ? null : json["courseId"],
    parentId: json["parentId"],
    title: json["title"] == null ? null : json["title"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    sessions: json["sessions"] == null ? null : List<ChapterSession>.from(json["sessions"].map((x) => ChapterSession.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "courseId": courseId == null ? null : courseId,
    "parentId": parentId,
    "title": title == null ? null : title,
    "orderId": orderId == null ? null : orderId,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
    "sessions": sessions == null ? null : List<dynamic>.from(sessions!.map((x) => x.toJson())),
  };
}

class ChapterSession {
  ChapterSession({
    this.id,
    this.chapterId,
    this.title,
    this.description,
    this.orderId,
    this.exerciseId,
    this.isAllowTrial,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.videos,
    this.documents,
  });

  int? id;
  int? chapterId;
  String? title;
  dynamic? description;
  int? orderId;
  int? exerciseId;
  bool? isAllowTrial;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  List<Video>? videos;
  List<Document>? documents;

  factory ChapterSession.fromJson(Map<String, dynamic> json) => ChapterSession(
    id: json["id"] == null ? null : json["id"],
    chapterId: json["chapterId"] == null ? null : json["chapterId"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
    isAllowTrial: json["isAllowTrial"] == null ? null : json["isAllowTrial"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    videos: json["videos"] == null ? null : List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    documents: json["documents"] == null ? null : List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "chapterId": chapterId == null ? null : chapterId,
    "title": title == null ? null : title,
    "description": description,
    "orderId": orderId == null ? null : orderId,
    "exerciseId": exerciseId == null ? null : exerciseId,
    "isAllowTrial": isAllowTrial == null ? null : isAllowTrial,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
    "videos": videos == null ? null : List<dynamic>.from(videos!.map((x) => x.toJson())),
    "documents": documents == null ? null : List<dynamic>.from(documents!.map((x) => x.toJson())),
  };
}

class Document {
  Document({
    this.source,
    this.id,
    this.sessionId,
    this.fileName,
    this.size,
    this.fileType,
    this.isPublic,
    this.createdAt,
    this.updatedAt,
  });

  String? source;
  int? id;
  int? sessionId;
  String? fileName;
  int? size;
  String? fileType;
  bool? isPublic;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    source: json["source"] == null ? null : json["source"],
    id: json["id"] == null ? null : json["id"],
    sessionId: json["sessionId"] == null ? null : json["sessionId"],
    fileName: json["fileName"] == null ? null : json["fileName"],
    size: json["size"] == null ? null : json["size"],
    fileType: json["fileType"] == null ? null : json["fileType"],
    isPublic: json["isPublic"] == null ? null : json["isPublic"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "source": source == null ? null : source,
    "id": id == null ? null : id,
    "sessionId": sessionId == null ? null : sessionId,
    "fileName": fileName == null ? null : fileName,
    "size": size == null ? null : size,
    "fileType": fileType == null ? null : fileType,
    "isPublic": isPublic == null ? null : isPublic,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class Video {
  Video({
    this.resolutions,
    this.id,
    this.sessionId,
    this.videoId,
    this.name,
    this.source,
    this.length,
    this.thumbnail,
    this.orderId,
    this.briefDescription,
    this.createdAt,
    this.updatedAt,
  });

  List<String>? resolutions;
  int? id;
  int? sessionId;
  String? videoId;
  String?  name;
  String? source;
  int? length;
  String? thumbnail;
  int? orderId;
  String? briefDescription;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    resolutions: json["resolutions"] == null ? null : List<String>.from(json["resolutions"].map((x) => x)),
    id: json["id"] == null ? null : json["id"],
    sessionId: json["sessionId"] == null ? null : json["sessionId"],
    videoId: json["videoId"] == null ? null : json["videoId"],
    name: json["name"] == null ? null :json["name"],
    source: json["source"] == null ? null : json["source"],
    length: json["length"] == null ? null : json["length"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    briefDescription: json["briefDescription"] == null ? null : json["briefDescription"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "resolutions": resolutions == null ? null : List<dynamic>.from(resolutions!.map((x) => x)),
    "id": id == null ? null : id,
    "sessionId": sessionId == null ? null : sessionId,
    "videoId": videoId == null ? null : videoId,
    "name": name == null ? null :name,
    "source": source == null ? null : source,
    "length": length == null ? null : length,
    "thumbnail": thumbnail == null ? null : thumbnail,
    "orderId": orderId == null ? null : orderId,
    "briefDescription": briefDescription == null ? null : briefDescription,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
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

  int? id;
  int? courseId;
  int? duration;
  int? retailPrice;
  int? discountPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic  deletedAt;

  factory PurchasePackage.fromJson(Map<String, dynamic> json) => PurchasePackage(
    id: json["id"] == null ? null : json["id"],
    courseId: json["courseId"] == null ? null : json["courseId"],
    duration: json["duration"] == null ? null : json["duration"],
    retailPrice: json["retailPrice"] == null ? null : json["retailPrice"],
    discountPrice: json["discountPrice"] == null ? null : json["discountPrice"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

  String? firstName;
  Attributes? attributes;
  String? email;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    firstName: json["first_name"] == null ? null : json["first_name"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
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
    this.dateOfBirth,
    this.registerVerificationToken,
    this.introduce,
    this.sex,
    this.introduceVideo,
    this.avatar,
    this.activedAt,
  });

  int? isLocked;
  String? dateOfBirth;
  String? registerVerificationToken;
  String? introduce;
  String? sex;
  String? introduceVideo;
  String? avatar;
  String? activedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    isLocked: json["is_locked"] == null ? null : json["is_locked"],
    dateOfBirth: json["date_of_birth"] == null ? null : json["date_of_birth"],
    registerVerificationToken: json["register_verification_token"] == null ? null : json["register_verification_token"],
    introduce: json["introduce"] == null ? null : json["introduce"],
    sex: json["sex"] == null ? null : json["sex"],
    introduceVideo: json["introduce_video"] == null ? null : json["introduce_video"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    activedAt: json["actived_at"] == null ? null : json["actived_at"],
  );

  Map<String, dynamic> toJson() => {
    "is_locked": isLocked == null ? null : isLocked,
    "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
    "register_verification_token": registerVerificationToken == null ? null : registerVerificationToken,
    "introduce": introduce == null ? null : introduce,
    "sex": sex == null ? null : sex,
    "introduce_video": introduceVideo == null ? null : introduceVideo,
    "avatar": avatar == null ? null : avatar,
    "actived_at": activedAt == null ? null : activedAt,
  };
}

class TrialChapter {
  TrialChapter({
    this.id,
    this.courseId,
    this.parentId,
    this.title,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.sessions,
  });

  int? id;
  int? courseId;
  dynamic parentId;
  String? title;
  int? orderId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<TrialChapterSession>? sessions;

  factory TrialChapter.fromJson(Map<String, dynamic> json) => TrialChapter(
    id: json["id"] == null ? null : json["id"],
    courseId: json["courseId"] == null ? null : json["courseId"],
    parentId: json["parentId"],
    title: json["title"] == null ? null : json["title"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    sessions: json["sessions"] == null ? null : List<TrialChapterSession>.from(json["sessions"].map((x) => TrialChapterSession.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "courseId": courseId == null ? null : courseId,
    "parentId": parentId,
    "title": title == null ? null : title,
    "orderId": orderId == null ? null : orderId,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
    "sessions": sessions == null ? null : List<dynamic>.from(sessions!.map((x) => x.toJson())),
  };
}

class TrialChapterSession {
  TrialChapterSession({
    this.id,
    this.chapterId,
    this.title,
    this.description,
    this.orderId,
    this.exerciseId,
    this.isAllowTrial,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.videos,
  });

  int? id;
  int? chapterId;
  String? title;
  dynamic description;
  int? orderId;
  int? exerciseId;
  bool? isAllowTrial;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<Video>? videos;

  factory TrialChapterSession.fromJson(Map<String, dynamic> json) => TrialChapterSession(
    id: json["id"] == null ? null : json["id"],
    chapterId: json["chapterId"] == null ? null : json["chapterId"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
    isAllowTrial: json["isAllowTrial"] == null ? null : json["isAllowTrial"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    videos: json["videos"] == null ? null : List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "chapterId": chapterId == null ? null : chapterId,
    "title": title == null ? null : title,
    "description": description,
    "orderId": orderId == null ? null : orderId,
    "exerciseId": exerciseId == null ? null : exerciseId,
    "isAllowTrial": isAllowTrial == null ? null : isAllowTrial,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
    "videos": videos == null ? null : List<dynamic>.from(videos!.map((x) => x.toJson())),
  };
}


