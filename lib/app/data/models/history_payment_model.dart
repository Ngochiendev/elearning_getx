// To parse this JSON data, do
//
//     final paymentHistory = paymentHistoryFromJson(jsonString);

import 'dart:convert';

PaymentHistory paymentHistoryFromJson(String str) =>
    PaymentHistory.fromJson(json.decode(str));

String paymentHistoryToJson(PaymentHistory data) => json.encode(data.toJson());

class PaymentHistory {
  PaymentHistory({
    this.message,
    this.data,
  });

  final String? message;
  final Data? data;

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.wallet,
    this.pagination,
  });

  final List<Wallet>? wallet;
  final Pagination? pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        wallet: json["wallet"] == null
            ? null
            : List<Wallet>.from(json["wallet"].map((x) => Wallet.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "wallet": wallet == null
            ? null
            : List<dynamic>.from(wallet!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination!.toJson(),
      };
}

class Pagination {
  Pagination({
    this.total,
    this.page,
    this.perPage,
  });

  final int? total;
  final int? page;
  final int? perPage;

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
    this.rechargeCode,
  });

  final String? id;
  final String? merchantCode;
  final String? userId;
  final String? transactionId;
  final String? type;
  final String? source;
  final String? status;
  final int? money;
  final String? balanceType;
  final int? balance;
  final String? note;
  final int? createdAt;
  final int? updatedAt;
  final bool? deleted;
  final RechargeCode? rechargeCode;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"] == null ? null : json["id"],
        merchantCode:
            json["merchant_code"] == null ? null : json["merchant_code"],
        userId: json["user_id"] == null ? null : json["user_id"],
        transactionId:
            json["transaction_id"] == null ? null : json["transaction_id"],
        type: json["type"] == null ? null : json["type"],
        source: json["source"] == null ? null : json["source"],
        status: json["status"] == null ? null : json["status"],
        money: json["money"] == null ? null : json["money"],
        balanceType: json["balance_type"] == null ? null : json["balance_type"],
        balance: json["balance"] == null ? null : json["balance"],
        note: json["note"] == null ? null : json["note"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        rechargeCode: json["rechargeCode"] == null
            ? null
            : RechargeCode.fromJson(json["rechargeCode"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "merchant_code": merchantCode == null ? null : merchantCode,
        "user_id": userId == null ? null : userId,
        "transaction_id": transactionId == null ? null : transactionId,
        "type": type == null ? null : type,
        "source": source == null ? null : source,
        "status": status == null ? null : status,
        "money": money == null ? null : money,
        "balance_type": balanceType == null ? null : balanceType,
        "balance": balance == null ? null : balance,
        "note": note == null ? null : note,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "deleted": deleted == null ? null : deleted,
        "rechargeCode": rechargeCode == null ? null : rechargeCode!.toJson(),
      };
}

class RechargeCode {
  RechargeCode({
    this.id,
    this.code,
    this.isUsed,
    this.userId,
    this.appliedFrom,
    this.applicationId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.applications,
  });

  final int? id;
  final String? code;
  final bool? isUsed;
  final String? userId;
  final DateTime? appliedFrom;
  final int? applicationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final Applications? applications;

  factory RechargeCode.fromJson(Map<String, dynamic> json) => RechargeCode(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        isUsed: json["isUsed"] == null ? null : json["isUsed"],
        userId: json["userId"] == null ? null : json["userId"],
        appliedFrom: json["appliedFrom"] == null
            ? null
            : DateTime.parse(json["appliedFrom"]),
        applicationId:
            json["applicationId"] == null ? null : json["applicationId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        applications: json["applications"] == null
            ? null
            : Applications.fromJson(json["applications"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "isUsed": isUsed == null ? null : isUsed,
        "userId": userId == null ? null : userId,
        "appliedFrom":
            appliedFrom == null ? null : appliedFrom!.toIso8601String(),
        "applicationId": applicationId == null ? null : applicationId,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "applications": applications == null ? null : applications!.toJson(),
      };
}

class Applications {
  Applications({
    this.id,
    this.type,
    this.title,
    this.amount,
    this.value,
    this.isActive,
    this.adminId,
    this.activeAt,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final int? id;
  final String? type;
  final String? title;
  final int? amount;
  final int? value;
  final bool? isActive;
  final String? adminId;
  final DateTime? activeAt;
  final DateTime? expiredAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory Applications.fromJson(Map<String, dynamic> json) => Applications(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        title: json["title"] == null ? null : json["title"],
        amount: json["amount"] == null ? null : json["amount"],
        value: json["value"] == null ? null : json["value"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        adminId: json["adminId"] == null ? null : json["adminId"],
        activeAt:
            json["activeAt"] == null ? null : DateTime.parse(json["activeAt"]),
        expiredAt: json["expiredAt"] == null
            ? null
            : DateTime.parse(json["expiredAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "title": title == null ? null : title,
        "amount": amount == null ? null : amount,
        "value": value == null ? null : value,
        "isActive": isActive == null ? null : isActive,
        "adminId": adminId == null ? null : adminId,
        "activeAt": activeAt == null ? null : activeAt!.toIso8601String(),
        "expiredAt": expiredAt == null ? null : expiredAt!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
