// To parse this JSON data, do
//
//     final videoSessionModel = videoSessionModelFromJson(jsonString);

import 'dart:convert';

VideoSessionModel videoSessionModelFromJson(String str) => VideoSessionModel.fromJson(json.decode(str));

String videoSessionModelToJson(VideoSessionModel data) => json.encode(data.toJson());

class VideoSessionModel {
    VideoSessionModel({
        this.message,
        this.data,
    });

    String? message;
    DataVideo? data;

    factory VideoSessionModel.fromJson(Map<String, dynamic> json) => VideoSessionModel(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataVideo.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class DataVideo {
    DataVideo({
        this.video,
    });

    VideoSession? video;

    factory DataVideo.fromJson(Map<String, dynamic> json) => DataVideo(
        video: json["video"] == null ? null : VideoSession.fromJson(json["video"]),
    );

    Map<String, dynamic> toJson() => {
        "video": video == null ? null : video!.toJson(),
    };
}

class VideoSession {
    VideoSession({
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
        this.session,
        this.downloadableUrl,
    });

    List<String>? resolutions;
    int? id;
    int? sessionId;
    String? videoId;
    dynamic name;
    String? source;
    int? length;
    String? thumbnail;
    int? orderId;
    String? briefDescription;
    DateTime? createdAt;
    DateTime? updatedAt;
    Session? session;
    String? downloadableUrl;

    factory VideoSession.fromJson(Map<String, dynamic> json) => VideoSession(
        resolutions: json["resolutions"] == null ? null : List<String>.from(json["resolutions"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        sessionId: json["sessionId"] == null ? null : json["sessionId"],
        videoId: json["videoId"] == null ? null : json["videoId"],
        name: json["name"],
        source: json["source"] == null ? null : json["source"],
        length: json["length"] == null ? null : json["length"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        briefDescription: json["briefDescription"] == null ? null : json["briefDescription"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        session: json["session"] == null ? null : Session.fromJson(json["session"]),
        downloadableUrl: json["downloadableUrl"] == null ? null : json["downloadableUrl"],
    );

    Map<String, dynamic> toJson() => {
        "resolutions": resolutions == null ? null : List<dynamic>.from(resolutions!.map((x) => x)),
        "id": id == null ? null : id,
        "sessionId": sessionId == null ? null : sessionId,
        "videoId": videoId == null ? null : videoId,
        "name": name,
        "source": source == null ? null : source,
        "length": length == null ? null : length,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "orderId": orderId == null ? null : orderId,
        "briefDescription": briefDescription == null ? null : briefDescription,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "session": session == null ? null : session!.toJson(),
        "downloadableUrl": downloadableUrl == null ? null : downloadableUrl,
    };
}

class Session {
    Session({
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
        this.chapter,
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
    Chapter? chapter;

    factory Session.fromJson(Map<String, dynamic> json) => Session(
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
        chapter: json["chapter"] == null ? null : Chapter.fromJson(json["chapter"]),
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
        "chapter": chapter == null ? null : chapter!.toJson(),
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
    });

    int? id;
    int? courseId;
    dynamic parentId;
    String? title;
    int? orderId;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"] == null ? null : json["id"],
        courseId: json["courseId"] == null ? null : json["courseId"],
        parentId: json["parentId"],
        title: json["title"] == null ? null : json["title"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
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
    };
}
