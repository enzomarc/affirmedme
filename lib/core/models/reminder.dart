class Reminder {
  String id;
  String group;
  String content;
  DateTime at;
  bool done;

  Reminder({this.id, this.content, this.group, this.done});

  Reminder.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    group = json['group'];
    content = json['content'];
    at = DateTime.parse(json['at']);
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['group'] = this.group;
    data['content'] = this.content;
    data['at'] = this.at.toString();
    data['done'] = this.done;

    return data;
  }
}
