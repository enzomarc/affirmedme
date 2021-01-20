import 'package:dio/dio.dart';
import 'package:kronosme/core/models/date.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/services/auth_service.dart';

class DateService {
  List<Date> dates = [];

  Future<List<Date>> getDates() async {
    try {
      User user = await auth.user();
      Response response = await worker.get("/dates/${user.id}");

      if (response.statusCode != 200)
        return dates;
      else {
        List data = response.data as List;
        dates = List<Date>.from(data.map((json) => Date.fromJson(json)));

        return dates;
      }
    } on DioError catch (e) {
      print(e);
      return dates;
    }
  }

  Future<bool> storeDate(Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response = await worker.post("/dates/${user.id}", params: data);

      return response.statusCode == 201;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateDate(String id, Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response = await worker.put("/dates/${user.id}/$id", params: data);

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteDate(String id) async {
    try {
      User user = await auth.user();
      Response response = await worker.delete("/dates/${user.id}/$id");

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

DateService dateService = DateService();
