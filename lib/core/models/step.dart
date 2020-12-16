import 'goal.dart';

class Step {
  String id;
  String title;
  List<Goal> goals;

  Step({
    this.id,
    this.title,
    this.goals,
  });

  Step.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    goals = List<Goal>.from(((json['goals']) as List).map((e) => Step.fromJson(e)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['goals'] = this.goals;

    return data;
  }
}
