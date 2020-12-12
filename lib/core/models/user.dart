class User {
  int id;
  String name;
  String email;
  String phone;
  bool premium;

  User({this.id, this.name, this.email, this.phone, this.premium});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['premium'] = this.premium;

    return data;
  }
}
