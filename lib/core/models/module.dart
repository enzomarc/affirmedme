import 'step.dart';

class Module {
  String id;
  String title;
  List<Step> steps;
  String type;

  Module({
    this.id,
    this.title,
    this.steps,
    this.type,
  });

  Module.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    steps = List<Step>.from(((json['steps']) as List).map((e) => Step.fromJson(e)));
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['steps'] = this.steps;
    data['type'] = this.type;

    return data;
  }
}
