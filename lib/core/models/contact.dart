class Contact {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String type;
  List<String> notes;

  Contact({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.type,
    this.notes,
  });

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    notes = List<String>.from(json['notes']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['notes'] = this.notes;

    return data;
  }
}
