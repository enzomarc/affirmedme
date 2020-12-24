import 'package:dio/dio.dart';
import 'package:kronosme/core/models/objective.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/services/auth_service.dart';

class GoalService {
  List<Objective> goals = [];

  Future<List<Objective>> getGoals() async {
    try {
      User user = await auth.user();
      Response response = await worker.get("/goals/${user.id}");

      if (response.statusCode != 200)
        return goals;
      else {
        List data = response.data as List;
        goals = List<Objective>.from(data.map((json) => Objective.fromJson(json)));

        return goals;
      }
    } on DioError catch (e) {
      print(e);
      return goals;
    }
  }

  Future<bool> storeGoal(Map<String, List<String>> data) async {
    try {
      User user = await auth.user();
      Response response = await worker.post("/goals/${user.id}", params: data);

      return response.statusCode == 201;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

GoalService goalService = GoalService();
