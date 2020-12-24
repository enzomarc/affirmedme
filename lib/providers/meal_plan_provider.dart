import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/meal_plan.dart';
import 'package:kronosme/services/meal_plan_service.dart';

class MealPlanProvider extends ChangeNotifier {
  List<MealPlan> meals = [];

  getMealPlans() {
    mealPlanService.getMeals().then((value) {
      meals = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
