class User {
  int? id;
  String? name;
  String? phone;

  User(
    this.id,
    this.name,
    this.phone,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    // var map = new Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}