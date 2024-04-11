import 'package:elearning/app/data/models/document_model.dart';
import 'package:elearning/app/data/models/video_model.dart';

class SessionsModel {
  int? id;
  int? chapterId;
  String? title;
  String? description;
  int? orderId;
  int? exerciseId;
  bool? isAllowTrial;
  String? createdAt;
  String? updatedAt;
  List<VideosModel>? videos;
  List<DocumentsModel>? documents;
  SessionsModel({
    this.id,
    this.chapterId,
    this.title,
    this.description,
    this.orderId,
    this.exerciseId,
    this.isAllowTrial,
    this.videos,
    this.documents,
  });

  SessionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapterId'];
    title = json['title'];
    description = json['description'];
    orderId = json['orderId'];
    exerciseId = json['exerciseId'];
    isAllowTrial = json['isAllowTrial'];
    if (json['videos'] != null) {
      videos = <VideosModel>[];
      json['videos'].forEach((v) {
        videos!.add(VideosModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['documents'] != null) {
      documents = <DocumentsModel>[];
      json['documents'].forEach((v) {
        documents!.add(DocumentsModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['chapterId'] = chapterId;
    data['title'] = title;
    data['description'] = description;
    data['orderId'] = orderId;
    data['exerciseId'] = exerciseId;
    data['isAllowTrial'] = isAllowTrial;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
