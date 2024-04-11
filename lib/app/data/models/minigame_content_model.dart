class MinigameContent {
  int? id;
  String? type;
  String? title;
  String? content;
  String? answerExplanation;
  List<Sets>? sets;
  List<Sets>? items;
  List<Answers>? answers;
  bool? isCompleted;

  MinigameContent({
    this.id,
    this.type,
    this.title,
    this.content,
    this.answerExplanation,
    this.sets,
    this.items,
    this.answers,
    this.isCompleted,
  });

  MinigameContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    content = json['content'];
    answerExplanation = json['answerExplanation'];
    if (json['sets'] != null) {
      sets = <Sets>[];
      json['sets'].forEach((v) {
        sets?.add(Sets.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Sets>[];
      json['items'].forEach((v) {
        items?.add(Sets.fromJson(v));
      });
    }
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['content'] = content;
    data['answerExplanation'] = answerExplanation;
    if (sets != null) {
      data['sets'] = sets?.map((v) => v.toJson()).toList();
    }
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    if (answers != null) {
      data['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    data['isCompleted'] = isCompleted;
    return data;
  }
}

class Sets {
  int? id;
  String? content;
  List<Answers>? answers;

  Sets({this.id, this.content, this.answers});

  Sets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    content = json['content'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    if (answers != null) {
      data['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? content;

  Answers({this.id, this.content});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    return data;
  }
}
