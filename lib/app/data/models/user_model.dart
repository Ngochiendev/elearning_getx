class UserModel {
  dynamic id;
  dynamic userID;
  int? roomID;
  bool? mutedMicro;
  bool? isHandup;
  bool? mutedVideo;
  String? merchantCode;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? status;
  String? attributeSetId;
  List? roles;
  AttributesModel? attributes;
  AttributesModel? attributesLive;
  ProvinceModel? province;
  bool? active;
  dynamic createdAt;
  dynamic updatedAt;
  UserModel({
    this.id,
    this.userID,
    this.isHandup,
    this.mutedMicro,
    this.mutedVideo,
    this.roomID,
    this.merchantCode,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.status,
    this.attributeSetId,
    this.roles,
    this.attributes,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['user_id'];
    roomID = json['room_id'];
    merchantCode = json['merchant_code'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    attributeSetId = json['attributeSetId'];
    roles = json['roles'];
    roles = json['roles'];
    attributes = json['attributes'] != null ? AttributesModel.fromJson(json['attributes']) : null;
    attributesLive = json['user_data'] == null ? null : AttributesModel.fromJson(json['user_data']['attributes']);
    province = json['province'] != null ? ProvinceModel.fromJson(json['province']) : null;
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mutedMicro = true;
    mutedVideo = true;
    isHandup = false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userID;
    data['room_id'] = roomID;
    data['merchant_code'] = merchantCode;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['attributeSetId'] = attributeSetId;
    data['roles'] = roles;
    if (attributes != null) {
      data['attributes'] = attributes?.toJson();
    }
    if (province != null) {
      data['province'] = province?.toJson();
    }
    data['active '] = active;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class AttributesModel {
  String? parentEmail;
  String? province;
  String? school;
  String? phone;
  // String? dateOfBirth;
  String? registerVerificationToken;
  // int? sex;
  String? avatar;
  String? className;
  String? activedAt;
  String? provinceId;
  AttributesModel(
      {this.parentEmail,
      this.province,
      this.school,
      this.phone,
      // this.dateOfBirth,
      this.registerVerificationToken,
      // this.sex,
      this.avatar,
      this.className,
      this.activedAt,
      this.provinceId});

  AttributesModel.fromJson(Map<String, dynamic> json) {
    parentEmail = json['parent_email'];
    province = json['province'];
    school = json['school'];
    phone = json['phone'];
    provinceId = json['province_id'];
    // dateOfBirth = json['date_of_birth'];
    registerVerificationToken = json['register_verification_token'];
    // sex = json['sex'];
    avatar = json['avatar'] == null || json['avatar'] == "" ? "" : json['avatar'];
    className = json['class'];
    activedAt = json['activedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['parent_email'] = parentEmail;
    data['province'] = province;
    data['school'] = school;
    data['phone'] = phone;
    data['province_id'] = provinceId;
    // data['date_of_birth'] = dateOfBirth;
    data['register_verification_token'] = registerVerificationToken;
    // data['sex'] = sex;
    data['avatar'] = avatar;
    data['class'] = className;
    data['activedAt'] = activedAt;
    return data;
  }
}

class ProvinceModel {
  ProvinceModel({
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

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
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
