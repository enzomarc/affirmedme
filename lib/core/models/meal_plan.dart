import 'dart:convert';

class MealPlan {
  String id;
  String group;
  String title;
  List<String> meals;

  MealPlan({this.id, this.group, this.title, List<String> meals});

  MealPlan.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    group = json['group'];
    title = json['title'];
    meals = List<String>.from((json['meals'] as List).map((e) => e.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['group'] = this.group;
    data['title'] = this.title;
    data['meals'] = jsonEncode(this.meals);

    return data;
  }
}
