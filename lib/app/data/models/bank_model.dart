class Bank {
  int? id;
  String? code;
  String? logo;
  String? name;
  String? shortName;

  Bank({this.id, this.code, this.logo, this.name, this.shortName});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    logo = json['logo'];
    name = json['name'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['logo'] = logo;
    data['name'] = name;
    data['shortName'] = shortName;
    return data;
  }
}
