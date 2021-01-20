import 'package:dio/dio.dart';
import 'package:kronosme/core/models/meal_plan.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/services/auth_service.dart';

class MealPlanService {
  List<MealPlan> meals = [];

  Future<List<MealPlan>> getMeals() async {
    try {
      User user = await auth.user();
      Response response = await worker.get("/meals/${user.id}");

      if (response.statusCode != 200)
        return meals;
      else {
        List data = response.data as List;
        meals = List<MealPlan>.from(data.map((json) => MealPlan.fromJson(json)));

        return meals;
      }
    } on DioError catch (e) {
      print(e);
      return meals;
    }
  }

  Future<bool> storeMealPlan(Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response = await worker.post("/meals/${user.id}", params: data);

      return response.statusCode == 201;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateMealPlan(String id, Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response = await worker.put("/meals/${user.id}/$id", params: data);

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteMealPlan(String id) async {
    try {
      User user = await auth.user();
      Response response = await worker.delete("/meals/${user.id}/$id");

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

MealPlanService mealPlanService = MealPlanService();
