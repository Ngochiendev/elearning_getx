class TeacherModel {
  String? id;
  String? merchantCode;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? attributeSetId;
  List? roles;
  AttributesModel? attributes;
  bool? active;
  dynamic createdAt;
  dynamic updatedAt;
  TeacherModel({
    this.id,
    this.merchantCode,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.attributeSetId,
    this.roles,
    this.attributes,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantCode = json['merchant_code'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    attributeSetId = json['attributeSetId'];
    roles = json['roles'];
    roles = json['roles'];
    attributes = json['attributes'] != null ? AttributesModel.fromJson(json['attributes']) : null;
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_code'] = merchantCode;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['attributeSetId'] = attributeSetId;
    data['roles'] = roles;
    if (attributes != null) {
      data['attributes'] = attributes?.toJson();
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
  // int? dateOfBirth;
  String? registerVerificationToken;
  // int? sex;
  String? avatar;
  String? className;
  String? activedAt;
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
      this.activedAt});

  AttributesModel.fromJson(Map<String, dynamic> json) {
    parentEmail = json['parent_email'];
    province = json['province'];
    school = json['school'];
    phone = json['phone'];
    // dateOfBirth = json['date_of_birth'];
    registerVerificationToken = json['register_verification_token'];
    // sex = json['sex'];
    avatar = json['avatar'];
    className = json['className'];
    activedAt = json['activedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['parent_email'] = parentEmail;
    data['province'] = province;
    data['school'] = school;
    data['phone'] = phone;
    // data['date_of_birth'] = dateOfBirth;
    data['register_verification_token'] = registerVerificationToken;
    // data['sex'] = sex;
    data['avatar'] = avatar;
    data['className '] = className;
    data['activedAt'] = activedAt;
    return data;
  }
}
