import 'package:logger/logger.dart';

class QuestionContent {
  int? id;
  String? type;
  String? title;
  String? content;
  dynamic answerExplanation;
  List<Children>? children;
  List<Children>? subQuestions;
  List<Children>? choices;
  String? filledAnswer;

  QuestionContent({this.id, this.type, this.title, this.content, this.answerExplanation, this.children, this.subQuestions, this.choices, this.filledAnswer});

  QuestionContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    content = json['content'];
    answerExplanation = json['answerExplanation'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children?.add(Children.fromJson(v));
      });
    }
    if (json['subQuestions'] != null) {
      subQuestions = <Children>[];
      json['subQuestions'].forEach((v) {
        subQuestions?.add(Children.fromJson(v));
      });
    }
    if (json['choices'] != null) {
      choices = <Children>[];
      json['choices'].forEach((v) {
        choices?.add(Children.fromJson(v));
      });
    }
    filledAnswer = json['filledAnswer'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['content'] = content;
    data['answerExplanation'] = answerExplanation;
    if (children != null) {
      data['children'] = children?.map((v) => v.toJson()).toList();
    }
    if (subQuestions != null) {
      data['subQuestions'] = subQuestions?.map((v) => v.toJson()).toList();
    }
    if (choices != null) {
      data['choices'] = choices?.map((v) => v.toJson()).toList();
    }
    data['filledAnswer'] = filledAnswer;
    return data;
  }
}

class Children {
  int? id;
  String? type;
  String? title;
  String? content;
  String? filledAnswer;
  String? answerExplanation;
  bool? isSelected;
  bool? isCorrect;
  List<Choices>? subQuestions;
  List<Choices>? choices;

  Children({this.id, this.type, this.title, this.content, this.answerExplanation, this.subQuestions, this.choices});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    content = json['content'];
    filledAnswer = json['filledAnswer'];
    answerExplanation = json['answerExplanation'];
    isSelected = json['isSelected'];
    isCorrect = json['isCorrect'];
    if (json['subQuestions'] != null) {
      subQuestions = <Choices>[];
      json['subQuestions'].forEach((v) {
        subQuestions?.add(Choices.fromJson(v));
      });
    }
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices?.add(Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['content'] = content;
    data['filledAnswer'] = filledAnswer;
    data['answerExplanation'] = answerExplanation;
    data['isSelected'] = isSelected;
    data['isCorrect'] = isCorrect;
    if (subQuestions != null) {
      data['subQuestions'] = subQuestions?.map((v) => v.toJson()).toList();
    }
    if (choices != null) {
      data['choices'] = choices?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  int? id;
  String? content;
  bool? isSelected;
  bool? isCorrect;

  Choices({this.id, this.content, this.isSelected});

  Choices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    isSelected = json['isSelected'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['isSelected'] = isSelected;
    data['isCorrect'] = isCorrect;
    return data;
  }
}
