class Date {
  String id;
  String name;
  String group;
  DateTime date;
  DateTime remindAt;

  Date({this.id, this.name, this.date, this.remindAt});

  Date.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    group = json['group'];
    date = DateTime.parse(json['date']);
    remindAt = DateTime.parse(json['remind_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['group'] = this.group;
    data['date'] = this.date.toString();
    data['remind_at'] = this.remindAt.toString();

    return data;
  }

  String getDate() {
    return "${this.date.year}/${this.date.month}/${this.date.day}";
  }

  String getRemindAt() {
    return "${this.remindAt.year}/${this.remindAt.month}/${this.remindAt.day}";
  }
}
