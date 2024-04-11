import 'package:elearning/app/data/models/liveclass_models/message_models.dart';

class DocumentLiveclassModel {
  int? id;
  String? creator;
  String? title;
  String? description;
  List<DataDocsLiveModel>? dataDocs;
  String? createdAt;
  String? updatedAt;
  DocumentLiveclassModel({
    this.id,
    this.creator,
    this.title,
    this.description,
    this.dataDocs,
    this.createdAt,
    this.updatedAt,
  });

  DocumentLiveclassModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creator = json['creator'];
    title = json['title'];
    description = json['description'];
    if (json['data'] != null) {
      dataDocs = <DataDocsLiveModel>[];
      json['data'].forEach((v) {
        dataDocs!.add(DataDocsLiveModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['creator'] = creator;
    data['title'] = title;
    data['description'] = description;
    if (dataDocs != null) {
      data['data'] = dataDocs!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class DataDocsLiveModel {
  String? id;
  String? title;
  List<DataChildLiveModel>? dataChildFirst;
  DataDocsLiveModel({
    this.id,
    this.title,
    this.dataChildFirst,
  });

  DataDocsLiveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['data'] != null) {
      dataChildFirst = <DataChildLiveModel>[];
      json['data'].forEach((v) {
        dataChildFirst!.add(DataChildLiveModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (dataChildFirst != null) {
      data['data'] = dataChildFirst!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataChildLiveModel {
  String? id;
  String? title;
  List<ExerciseLiveModel>? exercises;
  List<AttachmentModel>? attachments;
  DataChildLiveModel({
    this.id,
    this.title,
    this.exercises,
    this.attachments,
  });

  DataChildLiveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['exercise'] != null) {
      exercises = <ExerciseLiveModel>[];
      json['exercise'].forEach((v) {
        exercises!.add(ExerciseLiveModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['attachments'] != null) {
      attachments = <AttachmentModel>[];
      json['attachments'].forEach((v) {
        attachments!.add(AttachmentModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (exercises != null) {
      data['exercise'] = exercises!.map((v) => v.toJson()).toList();
    }
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExerciseLiveModel {
  String? type;
  String? title;
  int? exerciseId;
  String? displayType;
  ExerciseLiveModel({
    this.type,
    this.title,
    this.exerciseId,
    this.displayType,
  });

  ExerciseLiveModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    exerciseId = json['exerciseId'];
    displayType = json['displayType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['exerciseId'] = exerciseId;
    data['displayType'] = displayType;
    return data;
  }
}
