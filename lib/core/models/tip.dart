class Tip {
  String id;
  String content;
  String author;
  DateTime date;

  Tip({this.id, this.content, this.author, this.date});

  Tip.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    content = json['content'];
    author = json['author'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['content'] = this.content;
    data['author'] = this.author;
    data['date'] = this.date.toString();

    return data;
  }
}
