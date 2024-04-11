import 'package:elearning/app/data/models/liveclass_models/docs_liveclass_models.dart';

class RoomModel {
  int? id;
  String? name;
  int? classId;
  String? agoraRoomUuid;
  String? nestLessRegion;
  String? creator;
  String? startedAt;
  String? endedAt;
  dynamic extraData;
  List<DocumentLiveclassModel>? docs;
  dynamic conversation;
  String? nanoId;
  bool? isParticipated;
  String? createdAt;
  String? updatedAt;
  String? nameTeacher;
  RoomModel({
    this.id,
    this.name,
    this.classId,
    this.agoraRoomUuid,
    this.nestLessRegion,
    this.creator,
    this.startedAt,
    this.endedAt,
    this.extraData,
    this.docs,
    this.conversation,
    this.nanoId,
    this.isParticipated,
    this.createdAt,
    this.updatedAt,
    this.nameTeacher,
  });

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classId = json['class_id'];
    agoraRoomUuid = json['agora_room_uuid'];
    nestLessRegion = json['nest_less_region'];
    creator = json['creator'];
    startedAt = json['started_at'];
    endedAt = json['ended_at'];
    extraData = json['extra_data'];
    nameTeacher = json['conversation']['data'] != null && json['conversation']['data'].length > 0
        ? json['conversation']['data'].first['sender']['first_name']
        : null;
    if (json['docs'] != null) {
      docs = <DocumentLiveclassModel>[];
      json['docs'].forEach((v) {
        docs!.add(DocumentLiveclassModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    conversation = json['conversation'];
    nanoId = json['nano_id'];
    isParticipated = json['is_participated'];
    createdAt = json['updated_at'];
    updatedAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['class_id'] = classId;
    data['agora_room_uuid'] = agoraRoomUuid;
    data['nest_less_region'] = nestLessRegion;
    data['creator'] = creator;
    data['started_at'] = startedAt;
    data['ended_at'] = endedAt;
    data['extra_data'] = extraData;
    if (docs != null) {
      data['docs'] = docs!.map((v) => v.toJson()).toList();
    }
    data['conversation'] = conversation;
    data['nano_id'] = nanoId;
    data['is_participated'] = isParticipated;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
