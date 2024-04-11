import 'package:elearning/app/data/models/user_model.dart';

enum ActionNotification {
  CLAP,
  HAND_UP,
  HAND_DOWN,
  LOVE,
  LIKE,
  ANGRY,
  ROLL_CALL,
  REQUEST_TURN_ON_MIC,
  REQUEST_JOIN_ROOM,
  ACCEPT_JOIN_ROOM,
  CANCEL_JOIN_ROOM,
  VERIFIED_ROLL_CODE,
  REQUEST_TURN_ON_CAMERA,
  END_ROOM
}

class ListNotificationModel {
  int? id;
  int? classId;
  int? roomId;
  String? userId;
  String? source;
  String? action;
  ExtraDataModel? extraData;
  bool? enable;
  bool? read;
  String? createdAt;
  String? updatedAt;
  ListNotificationModel({
    this.id,
    this.classId,
    this.roomId,
    this.userId,
    this.source,
    this.action,
    this.extraData,
    this.enable,
    this.read,
    this.createdAt,
    this.updatedAt,
  });

  ListNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classId = json['classId'];
    roomId = json['room_id'];
    userId = json['user_id'];
    read = json['read'];
    action = json['action'];
    extraData =
        json['extra_data'] != null ? ExtraDataModel.fromJson(Map<String, dynamic>.from(json['extra_data'])) : null;
    source = json['source'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['classId'] = classId;
    data['action'] = action;
    // data['action'] = actions.reverse[action];
    if (extraData != null) {
      data['extraData'] = extraData!.toJson();
    }
    data['room_id'] = roomId;
    data['user_id'] = userId;
    data['read'] = read;
    data['source'] = source;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  final actions = EnumValues({
    "CLAP": ActionNotification.CLAP,
    "LIKE": ActionNotification.LIKE,
    "HAND_UP": ActionNotification.HAND_UP,
    "HAND_DOWN": ActionNotification.HAND_DOWN,
    "LOVE": ActionNotification.LOVE,
    "ANGRY": ActionNotification.ANGRY,
    "ROLL_CALL": ActionNotification.ROLL_CALL,
    "REQUEST_TURN_ON_MIC": ActionNotification.REQUEST_TURN_ON_MIC,
    "REQUEST_JOIN_ROOM": ActionNotification.REQUEST_JOIN_ROOM,
    "ACCEPT_JOIN_ROOM": ActionNotification.ACCEPT_JOIN_ROOM,
    "CANCEL_JOIN_ROOM": ActionNotification.CANCEL_JOIN_ROOM,
    "REQUEST_TURN_ON_CAMERA": ActionNotification.REQUEST_TURN_ON_CAMERA,
    "END_ROOM": ActionNotification.END_ROOM,
    "VERIFIED_ROLL_CODE": ActionNotification.VERIFIED_ROLL_CODE,
  });
}

class ExtraDataModel {
  UserModel? sender;
  bool? checked;
  int? roomId;
  int? classId;
  ExtraDataModel({
    this.sender,
    this.checked,
    this.roomId,
    this.classId,
  });

  ExtraDataModel.fromJson(Map<String, dynamic> json) {
    sender = json['sender'] != null ? UserModel.fromJson(Map<String, dynamic>.from(json['sender'])) : null;
    checked = json['checked'];
    roomId = json['room_id'];
    classId = json['class_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['checked'] = checked;
    data['room_id'] = roomId;
    data['class_id'] = classId;
    return data;
  }
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
