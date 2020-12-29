import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kronosme/core/models/reminder.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/main.dart';
import 'package:kronosme/services/auth_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

      if (response.statusCode == 201) scheduleNotification(data);

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

      if (response.statusCode == 200) scheduleNotification(data);

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

  void scheduleNotification(Map<String, dynamic> data) async {
    tz.initializeTimeZones();
    var at = tz.TZDateTime.parse(tz.local, data['at']);
    var androidSpecs = AndroidNotificationDetails(
      'reminder_channel',
      'reminder_channel',
      "Channel for reminders",
      icon: 'app_logo',
    );

    var iosSpecs = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
    );

    var platformSpecs =
        NotificationDetails(android: androidSpecs, iOS: iosSpecs);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'AffirmedMe Reminder',
      data['content'],
      at,
      platformSpecs,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}

ReminderService reminderService = ReminderService();
