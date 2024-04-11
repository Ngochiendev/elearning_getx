// To parse this JSON data, do
//
//     final pointHistory = pointHistoryFromJson(jsonString);

import 'dart:convert';

PointHistory pointHistoryFromJson(String str) => PointHistory.fromJson(json.decode(str));

String pointHistoryToJson(PointHistory data) => json.encode(data.toJson());

class PointHistory {
  PointHistory({
    this.message,
    this.data,
  });

  String? message;
  DataPointHistory? data;

  factory PointHistory.fromJson(Map<String, dynamic> json) => PointHistory(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : DataPointHistory.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class DataPointHistory {
  DataPointHistory({
    this.wallet,
    this.pagination,
  });

  List<Wallet>? wallet;
  Pagination? pagination;

  factory DataPointHistory.fromJson(Map<String, dynamic> json) => DataPointHistory(
    wallet: json["wallet"] == null ? null : List<Wallet>.from(json["wallet"].map((x) => Wallet.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet == null ? null : List<dynamic>.from(wallet!.map((x) => x.toJson())),
    "pagination": pagination == null ? null : pagination!.toJson(),
  };
}

class Pagination {
  Pagination({
    this.total,
    this.page,
    this.perPage,
  });

  int? total;
  int? page;
  int? perPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"] == null ? null : json["total"],
    page: json["page"] == null ? null : json["page"],
    perPage: json["perPage"] == null ? null : json["perPage"],
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "page": page == null ? null : page,
    "perPage": perPage == null ? null : perPage,
  };
}

class Wallet {
  Wallet({
    this.id,
    this.merchantCode,
    this.userId,
    this.transactionId,
    this.type,
    this.source,
    this.status,
    this.money,
    this.balanceType,
    this.balance,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.exerciseInfo,
  });

  String? id;
  String? merchantCode;
  String? userId;
  String? transactionId;
  String? type;
  String? source;
  String? status;
  int? money;
  String? balanceType;
  int? balance;
  String? note;
  int? createdAt;
  int? updatedAt;
  bool? deleted;
  ExerciseInfo? exerciseInfo;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"] == null ? null : json["id"],
    merchantCode: json["merchant_code"] == null ? null : json["merchant_code"],
    userId: json["user_id"] == null ? null : json["user_id"],
    transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
    type: json["type"] == null ? null : json["type"],
    source: json["source"] == null ? null : json["source"],
    status: json["status"] == null ? null :json["status"],
    money: json["money"] == null ? null : json["money"],
    balanceType: json["balance_type"] == null ? null : json["balance_type"],
    balance: json["balance"] == null ? null : json["balance"],
    note: json["note"] == null ? null :json["note"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    deleted: json["deleted"] == null ? null : json["deleted"],
    exerciseInfo: json["exerciseInfo"] == null ? null : ExerciseInfo.fromJson(json["exerciseInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "merchant_code": merchantCode == null ? null : merchantCode,
    "user_id": userId == null ? null : userId,
    "transaction_id": transactionId == null ? null : transactionId,
    "type": type == null ? null : type,
    "source": source == null ? null : source,
    "status": status == null ? null :status,
    "money": money == null ? null : money,
    "balance_type": balanceType == null ? null :balanceType,
    "balance": balance == null ? null : balance,
    "note": note == null ? null : note,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "deleted": deleted == null ? null : deleted,
    "exerciseInfo": exerciseInfo == null ? null : exerciseInfo!.toJson(),
  };
}



class ExerciseInfo {
  ExerciseInfo({
    this.id,
    this.exercisableType,
    this.exercisableId,
    this.exerciseId,
    this.userId,
    this.title,
    this.description,
    this.status,
    this.duration,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? exercisableType;
  int? exercisableId;
  int? exerciseId;
  String? userId;
  String? title;
  String? description;
  String? status;
  int? duration;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ExerciseInfo.fromJson(Map<String, dynamic> json) => ExerciseInfo(
    id: json["id"] == null ? null : json["id"],
    exercisableType: json["exercisableType"] == null ? null : json["exercisableType"],
    exercisableId: json["exercisableId"] == null ? null : json["exercisableId"],
    exerciseId: json["exerciseId"] == null ? null : json["exerciseId"],
    userId: json["userId"] == null ? null : json["userId"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    status: json["status"] == null ? null : json["status"],
    duration: json["duration"] == null ? null : json["duration"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "exercisableType": exercisableType == null ? null : exercisableType,
    "exercisableId": exercisableId == null ? null : exercisableId,
    "exerciseId": exerciseId == null ? null : exerciseId,
    "userId": userId == null ? null : userId,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "status": status == null ? null : status,
    "duration": duration == null ? null : duration,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}



