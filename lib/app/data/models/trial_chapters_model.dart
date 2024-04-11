import 'package:elearning/app/data/models/sessions_model.dart';

class TrialChapters {
  int? id;
  int? courseId;
  int? parentId;
  String? title;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  List<SessionsModel>? sessions;
  TrialChapters({
    this.id,
    this.courseId,
    this.parentId,
    this.title,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.sessions,
  });

  TrialChapters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    parentId = json['parentId'];
    title = json['title'];
    orderId = json['orderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['sessions'] != null) {
      sessions = <SessionsModel>[];
      json['sessions'].forEach((v) {
        sessions!.add(SessionsModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['courseId'] = courseId;
    data['parentId'] = parentId;
    data['title'] = title;
    data['orderId'] = orderId;
    data['createdAt'] = createdAt;
    if (sessions != null) {
      data['sessions'] = sessions!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = updatedAt;
    return data;
  }
}
