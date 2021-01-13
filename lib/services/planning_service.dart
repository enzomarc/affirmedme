import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kronosme/core/models/planning.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/services/auth_service.dart';

class PlanningService {
  List<Planning> plannings = [];

  Future<List<Planning>> getPlannings() async {
    try {
      User user = await auth.user();
      Response response = await worker.get("/planning/${user.id}");

      if (response.statusCode != 200)
        return plannings;
      else {
        List data = response.data as List;
        plannings = List<Planning>.from(data.map((json) => Planning.fromJson(json)));

        return plannings;
      }
    } on DioError catch (e) {
      print(e);
      return plannings;
    }
  }

  Future<bool> storePlanning(Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response = await worker.post("/planning/${user.id}", params: data);

      return response.statusCode == 201;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updatePlanning(String id, Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response = await worker.put("/planning/${user.id}/$id", params: data);

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deletePlanning(String id) async {
    try {
      User user = await auth.user();
      Response response = await worker.delete("/planning/${user.id}/$id");

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

PlanningService planningService = PlanningService();
