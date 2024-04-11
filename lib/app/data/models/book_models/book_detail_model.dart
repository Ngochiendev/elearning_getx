import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/book_models/cate_model.dart';
import 'package:elearning/app/data/models/book_models/specify_categories_model.dart';
import 'package:elearning/app/data/models/book_models/table_of_content_model.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/data/models/document_model.dart';
import 'package:elearning/app/data/models/book_models/information_model.dart';
import 'package:elearning/app/data/models/grade_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';

class EbookDetailsModel {
  int? id;
  String? title;
  String? slug;
  String? ownerId;
  String? cover;
  String? tableOfContentImage;
  String? freePdf;
  String? background;
  String? briefDescription;
  String? description;
  bool? isFree;
  String? status;
  int? orderId;
  bool? tableOfContentIsPicture;
  bool? isHighlight;
  String? createdAt;
  String? updatedAt;
  List<CateModel>? categories;
  List<InformationBookModel>? information;
  List<DocumentsModel>? documents;
  List<SpecifyCategoriesModel>? specifyCategoryRefs;
  List<TableOfContentBookModel>? tableOfContent;
  List<AuthorModel>? authorRefs;
  List<GradeModel>? gradeRefs;
  List<InforProduct>? bookPackages;
  List<AskedQuestions>? askedQuestion;
  int? ratingAvg;
  int? totalCountRating;
  int? isAlreadyPurchased;
  bool? isAllowTrial;
  EbookDetailsModel(
      {this.id,
      this.title,
      this.slug,
      this.ownerId,
      this.cover,
      this.tableOfContentImage,
      this.freePdf,
      this.background,
      this.briefDescription,
      this.description,
      this.isFree,
      this.status,
      this.orderId,
      this.tableOfContentIsPicture,
      this.isHighlight,
      this.createdAt,
      this.updatedAt,
      this.categories,
      this.information,
      this.documents,
      this.tableOfContent,
      this.gradeRefs,
      this.bookPackages,
      this.authorRefs,
      this.specifyCategoryRefs,
      this.ratingAvg,
      this.totalCountRating,this.askedQuestion,this.isAlreadyPurchased,this.isAllowTrial});

  EbookDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    ownerId = json['ownerId'];
    cover = json['cover'];
    tableOfContentImage = json['tableOfContentImage'];
    freePdf = json['freePdf'];
    background = json['background'];
    briefDescription = json['briefDescription'];
    description = json['description'] == null || json['description'] == ""
        ? ""
        : json['description'];
    isFree = json['isFree'];
    status = json['status'];
    orderId = json['orderId'];
    tableOfContentIsPicture = json['tableOfContentIsPicture'];
    isHighlight = json['isHighlight'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ratingAvg = json['ratingAvg'];
    totalCountRating = json['totalCountRating'];
    isAlreadyPurchased=json['isAlreadyPurchased']==null?null:json['isAlreadyPurchased'];
    isAllowTrial=json['isAllowTrial']==null?0:json['isAllowTrial'];
    if (json['authorRefs'] != null) {
      authorRefs = <AuthorModel>[];
      json['authorRefs'].forEach((v) {
        authorRefs!.add(AuthorModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }

    if (json['specifyCategoryRefs'] != null) {
      specifyCategoryRefs = <SpecifyCategoriesModel>[];
      json['specifyCategoryRefs'].forEach((v) {
        specifyCategoryRefs!
            .add(SpecifyCategoriesModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['categories'] != null) {
      categories = <CateModel>[];
      json['categories'].forEach((v) {
        categories!.add(CateModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['information'] != null) {
      information = <InformationBookModel>[];
      json['information'].forEach((v) {
        information!
            .add(InformationBookModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['documents'] != null) {
      documents = <DocumentsModel>[];
      json['documents'].forEach((v) {
        documents!.add(DocumentsModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['tableOfContent'] != null) {
      tableOfContent = <TableOfContentBookModel>[];
      json['tableOfContent'].forEach((v) {
        tableOfContent!.add(
            TableOfContentBookModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['gradeRefs'] != null) {
      gradeRefs = <GradeModel>[];
      json['gradeRefs'].forEach((v) {
        gradeRefs!.add(GradeModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['purchasePackages'] != null) {
      bookPackages = <InforProduct>[];
      json['purchasePackages'].forEach((v) {
        bookPackages!
            .add(InforProduct.fromJson(Map<String, dynamic>.from(v)));
      });
    }

    if (json['bookPackages'] != null) {
      bookPackages = <InforProduct>[];
      json['bookPackages'].forEach((v) {
        bookPackages!
            .add(InforProduct.fromJson(Map<String, dynamic>.from(v)));
      });
    }
    if (json['frequentlyAskedQuestions'] != null) {
      askedQuestion = <AskedQuestions>[];
      json['frequentlyAskedQuestions'].forEach((v) {
        askedQuestion!
            .add(AskedQuestions.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['ownerId'] = ownerId;
    data['cover'] = cover;
    data['tableOfContentImage'] = tableOfContentImage;
    data['background'] = background;
    data['briefDescription'] = briefDescription;
    data['description'] = description;
    data['isFree'] = isFree;
    data['status'] = status;
    data['orderId'] = orderId;
    data['tableOfContentIsPicture'] = tableOfContentIsPicture;
    data['isHighlight'] = isHighlight;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['ratingAvg'] = ratingAvg;
    data['totalCountRating'] = totalCountRating;
    if (authorRefs != null) {
      data['authorRefs'] = authorRefs!.map((v) => v.toJson()).toList();
    }
    if (specifyCategoryRefs != null) {
      data['specifyCategoryRefs'] =
          specifyCategoryRefs!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (information != null) {
      data['information'] = information!.map((v) => v.toJson()).toList();
    }
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    if (gradeRefs != null) {
      data['gradeRefs'] = gradeRefs!.map((v) => v.toJson()).toList();
    }
    if (bookPackages != null) {
      data['bookPackages'] = bookPackages!.map((v) => v.toJson()).toList();
      data['purchasePackages'] = bookPackages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AskedQuestions {
  int? id;
  int? bookId;
  String? question;
  String? answer;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  AskedQuestions(
      {this.id,
      this.bookId,
      this.question,
      this.answer,
      this.orderId,
      this.createdAt,
      this.updatedAt});

  AskedQuestions.fromJson(Map<String, dynamic> json) {
    id = json["id"] == null ? null : json["id"];
    bookId = json["bookId"] == null ? null : json["bookId"];
    question = json["question"] == null ? null : json["question"];
    answer = json["answer"] == null ? null : json["answer"];
    orderId = json["orderId"] == null ? null : json["orderId"];
    createdAt = json["createdAt"] == null ? null : json["createdAt"];
    updatedAt = json["updatedAt"] == null ? null : json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id == null ? null : id;
    data['bookId'] = bookId == null ? null : bookId;
    data['question'] = question == null ? null : question;
    data['answer'] = answer == null ? null : answer;
    data['orderId'] = orderId == null ? null : orderId;
    data['createdAt'] = createdAt == null ? null : createdAt;
    data['updatedAt'] = updatedAt == null ? null : updatedAt;
    return data;
  }
}
