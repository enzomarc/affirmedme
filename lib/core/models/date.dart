class Date {
  String id;
  String label;
  DateTime at;

  Date({this.id, this.label, this.at});

  Date.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    label = json['label'];
    at = DateTime.parse(json['at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['label'] = this.label;
    data['at'] = this.at.toString();

    return data;
  }

  String getDate() {
    return "${this.at.year}/${this.at.month}/${this.at.day}";
  }
}
