class Goal {
  String id;
  String title;
  List<String> tips;

  Goal({
    this.id,
    this.title,
    this.tips,
  });

  Goal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tips = json['tips'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['tips'] = this.tips;

    return data;
  }
}
