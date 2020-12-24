class Objective {
  String id;
  String user;
  String objective;
  String content;

  Objective({
    this.id,
    this.user,
    this.objective,
    this.content,
  });

  Objective.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    user = json['user'];
    objective = json['objective'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['user'] = this.user;
    data['objective'] = this.objective;
    data['content'] = this.content;

    return data;
  }
}
