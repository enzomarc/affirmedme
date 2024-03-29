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
    id = json['_id'];
    title = json['title'];
    goals = json['goals'] != null
        ? List<Goal>.from(
            ((json['goals']) as List).map((e) => Goal.fromJson(e)))
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['goals'] = this.goals;

    return data;
  }
}
