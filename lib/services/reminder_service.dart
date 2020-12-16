import 'package:dio/dio.dart';
import 'package:kronosme/core/models/reminder.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/services/auth_service.dart';

class ReminderService {
  List<Reminder> reminders = [];

  Future<List<Reminder>> getReminders() async {
    try {
      User user = await auth.user();
      Response response = await worker.get("/reminders/${user.id}");

      if (response.statusCode != 200)
        return reminders;
      else {
        List data = response.data as List;
        reminders =
            List<Reminder>.from(data.map((json) => Reminder.fromJson(json)));

        return reminders;
      }
    } on DioError catch (e) {
      print(e);
      return reminders;
    }
  }

  Future<bool> storeReminder(Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response =
          await worker.post("/reminders/${user.id}", params: data);

      return response.statusCode == 201;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateReminder(String id, Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response =
          await worker.put("/reminders/${user.id}/$id", params: data);

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteReminder(String id) async {
    try {
      User user = await auth.user();
      Response response = await worker.delete("/reminders/${user.id}/$id");

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

ReminderService reminderService = ReminderService();
