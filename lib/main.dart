import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kronosme/core/affirmed.dart';
import 'package:kronosme/providers/contact_provider.dart';
import 'package:kronosme/providers/date_provider.dart';
import 'package:kronosme/providers/goal_provider.dart';
import 'package:kronosme/providers/meal_plan_provider.dart';
import 'package:kronosme/providers/module_provider.dart';
import 'package:kronosme/providers/podcast_provider.dart';
import 'package:kronosme/providers/reminder_provider.dart';
import 'package:kronosme/services/auth_service.dart';
import 'package:kronosme/services/module_service.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool connected = false;

  var initSettingsAndroid = AndroidInitializationSettings('app_logo');
  var initSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {},
  );
  var initSettings = InitializationSettings(
      android: initSettingsAndroid, iOS: initSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onSelectNotification: (payload) async {
      if (payload != null) {
        debugPrint("Notification payload: $payload");
      }
    },
  );

  try {
    connected = await auth.check();

    if (connected) {
      // load users params here
      await moduleService.getModules();
    }
  } catch (e) {
    print(e);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModuleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GoalProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ReminderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PodcastProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DateProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MealPlanProvider(),
        ),
      ],
      child: Affirmed(connected ? '/dashboard' : '/login'),
    ),
  );
}
