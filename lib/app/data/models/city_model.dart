// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.message,
    this.data,
  });

  String? message;
  DataCity? data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : DataCity.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class DataCity {
  DataCity({
    this.provinces,
  });

  List<Province>? provinces;

  factory DataCity.fromJson(Map<String, dynamic> json) => DataCity(
    provinces: json["provinces"] == null ? null : List<Province>.from(json["provinces"].map((x) => Province.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "provinces": provinces == null ? null : List<dynamic>.from(provinces!.map((x) => x.toJson())),
  };
}

class Province {
  Province({
    this.id,
    this.code,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? code;
  String? title;
  dynamic createdAt;
  dynamic updatedAt;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    id: json["id"] == null ? null : json["id"],
    code: json["code"] == null ? null : json["code"],
    title: json["title"] == null ? null : json["title"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : code,
    "title": title == null ? null : title,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
