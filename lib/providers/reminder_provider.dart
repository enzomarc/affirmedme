import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/reminder.dart';
import 'package:kronosme/services/reminder_service.dart';

class ReminderProvider extends ChangeNotifier {
  List<Reminder> reminders = [];

  getReminders() {
    reminderService.getReminders().then((value) {
      reminders = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
