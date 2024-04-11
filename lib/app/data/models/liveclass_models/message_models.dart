import 'package:elearning/app/data/models/teacher_model.dart';

class ChatModel {
  String? id;
  TeacherModel? sender;
  List? readBy;
  List<AttachmentModel>? attachments;
  int? roomId;
  int? classId;
  String? type;
  String? host;
  dynamic text;
  String? conversationId;
  String? createdAt;
  String? updatedAt;
  ChatModel({
    this.id,
    this.sender,
    this.classId,
    this.readBy,
    this.attachments,
    this.roomId,
    this.type,
    this.host,
    this.text,
    this.conversationId,
    this.createdAt,
    this.updatedAt,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    sender = json['sender'] != null ? TeacherModel.fromJson(Map<String, dynamic>.from(json['sender'])) : null;
    classId = json['class_id'];
    readBy = json['read_by'];
    if (json['attachments'] != null) {
      attachments = <AttachmentModel>[];
      json['attachments'].forEach((v) {
        attachments!.add(AttachmentModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    roomId = json['room_id'];
    type = json['type'];
    host = json['host'];
    text = json['text'];
    conversationId = json['conversation_id'];
    createdAt = json['updated_at'];
    updatedAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['class_id'] = classId;
    data['read_by'] = readBy;
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    data['room_id'] = roomId;
    data['type'] = type;
    data['host'] = host;
    data['text'] = text;
    data['conversation_id'] = conversationId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AttachmentModel {
  int? id;
  String? type;
  String? name;
  String? url;
  AttachmentModel({
    this.id,
    this.type,
    this.name,
    this.url,
  });

  AttachmentModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
