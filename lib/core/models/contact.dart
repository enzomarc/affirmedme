class Contact {
  String id;
  String name;
  String location;
  String industry;
  String hobby;
  String email;
  String phone;
  DateTime birthday;
  DateTime lastContact;
  DateTime nextContact;
  DateTime remindAt;
  List<String> notes;

  Contact({
    this.id,
    this.name,
    this.location,
    this.industry,
    this.hobby,
    this.email,
    this.phone,
    this.birthday,
    this.lastContact,
    this.nextContact,
    this.remindAt,
    this.notes,
  });

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    location = json['location'];
    industry = json['industry'];
    hobby = json['hobby'];
    email = json['email'];
    phone = json['phone'];
    birthday = DateTime.parse(json['birthday']);
    lastContact = DateTime.parse(json['last_contact']);
    nextContact = DateTime.parse(json['next_contact']);
    remindAt = DateTime.parse(json['remind_at']);
    notes = List<String>.from(json['notes']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['industry'] = this.industry;
    data['hobby'] = this.hobby;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday.toString();
    data['last_contact'] = this.lastContact.toString();
    data['next_contact'] = this.nextContact.toString();
    data['remind_at'] = this.remindAt.toString();
    data['notes'] = this.notes;

    return data;
  }
}
