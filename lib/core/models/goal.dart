class Goal {
  String id;
  String title;
  List<String> tips;
  bool checked;

  Goal({
    this.id,
    this.title,
    this.tips,
    this.checked,
  });

  Goal.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    tips = List<String>.from(json['tips']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['tips'] = this.tips;

    return data;
  }
}
