class TableOfContentBookModel {
  int? id;
  int? bookId;
  int? parentId;
  int? orderId;
  String? title;
  int? pageFrom;
  int? pageTo;
  bool? isAllowTrial;
  String? createdAt;
  String? updatedAt;
  List<ChildrenBookModel>? children;

  TableOfContentBookModel({
    this.id,
    this.bookId,
    this.parentId,
    this.orderId,
    this.title,
    this.pageFrom,
    this.pageTo,
    this.isAllowTrial,
    this.createdAt,
    this.updatedAt,
    this.children,
  });

  TableOfContentBookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    bookId = json['bookId'];
    orderId = json['orderId'];
    title = json['title'];
    pageFrom = json['pageFrom'];
    pageTo = json['pageTo'];
    isAllowTrial = json['isAllowTrial'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['children'] != null) {
      children = <ChildrenBookModel>[];
      json['children'].forEach((v) {
        children!.add(ChildrenBookModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['parentId'] = parentId;
    data['bookId'] = bookId;
    data['orderId'] = orderId;
    data['title'] = title;
    data['pageFrom'] = pageFrom;
    data['pageTo'] = pageTo;
    data['isAllowTrial'] = isAllowTrial;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildrenBookModel {
  int? id;
  int? bookId;
  int? parentId;
  int? orderId;
  String? title;
  int? pageFrom;
  int? pageTo;
  bool? isAllowTrial;
  String? createdAt;
  String? updatedAt;
  List? children;

  ChildrenBookModel({
    this.id,
    this.bookId,
    this.parentId,
    this.orderId,
    this.title,
    this.pageFrom,
    this.pageTo,
    this.isAllowTrial,
    this.createdAt,
    this.updatedAt,
    this.children,
  });

  ChildrenBookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    bookId = json['bookId'];
    orderId = json['orderId'];
    title = json['title'];
    pageFrom = json['pageFrom'];
    pageTo = json['pageTo'];
    isAllowTrial = json['isAllowTrial'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    children = json['children'];
    // if (json['children'] != null) {
    //   children = <ChildrenBookModel>[];
    //   json['bookSpecifyCategoriesModel'].forEach((v) {
    //     children!.add(ChildrenBookModel.fromJson(Map<String, dynamic>.from(v)));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['parentId'] = parentId;
    data['orderId'] = orderId;
    data['title'] = title;
    data['pageFrom'] = pageFrom;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['children'] = children;
    // if (children != null) {
    //   data['children'] = children!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
