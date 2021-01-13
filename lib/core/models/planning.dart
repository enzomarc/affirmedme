class Planning {
  String id;
  String activity;
  List<PlanningCategory> categories;

  Planning({
    this.id,
    this.activity,
    this.categories,
  });

  Planning.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    activity = json['activity'];
    categories = List<PlanningCategory>.from((json['categories'] as List).map((e) => PlanningCategory.fromJson(e))).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['activity'] = this.activity;
    data['categories'] = this.categories.map((e) => e.toJson()).toList();

    return data;
  }
}

class PlanningCategory {
  String title;
  List<String> items;

  PlanningCategory({
    this.title,
    this.items,
  });

  PlanningCategory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    items = List<String>.from(json['items']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['items'] = this.items;

    return data;
  }
}
