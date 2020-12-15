import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/objective.dart';
import 'package:kronosme/services/goal_service.dart';

class GoalProvider extends ChangeNotifier {
  List<Objective> goals = [];

  getGoals() {
    goalService.getGoals().then((value) {
      goals = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
