import 'package:flutter/material.dart';
import 'package:kronosme/core/affirmed.dart';
import 'package:kronosme/providers/contact_provider.dart';
import 'package:kronosme/providers/goal_provider.dart';
import 'package:kronosme/providers/module_provider.dart';
import 'package:kronosme/providers/podcast_provider.dart';
import 'package:kronosme/providers/reminder_provider.dart';
import 'package:kronosme/services/auth_service.dart';
import 'package:kronosme/services/module_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool connected = false;

  try {
    connected = await auth.check();

    if (connected) {
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
      ],
      child: Affirmed(connected ? '/dashboard' : '/login'),
    ),
  );
}
