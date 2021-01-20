import 'package:flutter/material.dart';
import 'package:kronosme/screens/contacts/add_contact.dart';
import 'package:kronosme/screens/contacts/contact.dart';
import 'package:kronosme/screens/contacts/contact_information.dart';
import 'package:kronosme/screens/dashboard/container.dart';
import 'package:kronosme/screens/dates/module.dart';
import 'package:kronosme/screens/login.dart';
import 'package:kronosme/screens/meals/add_meal.dart';
import 'package:kronosme/screens/meals/show.dart';
import 'package:kronosme/screens/misc/add_goal.dart';
import 'package:kronosme/screens/misc/description.dart';
import 'package:kronosme/screens/misc/learning.dart';
import 'package:kronosme/screens/misc/package.dart';
import 'package:kronosme/screens/misc/scanCard.dart';
import 'package:kronosme/screens/misc/upgrade.dart';
import 'package:kronosme/screens/misc/welcome.dart';
import 'package:kronosme/screens/planning/add.dart';
import 'package:kronosme/screens/planning/edit.dart';
import 'package:kronosme/screens/planning/list.dart';
import 'package:kronosme/screens/signup/basic.dart';
import 'package:kronosme/screens/signup/premium.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/description': (context) => DescriptionPage(),
  '/welcome': (context) => WelcomeScreen(),
  '/package': (context) => PackageScreen(),
  '/signup': (context) => PremiumSignup(),
  '/basic_signup': (context) => BasicSignUp(),
  '/login': (context) => LoginPage(),
  '/dashboard': (context) => DashboardScreen(),
  '/upgrade': (context) => UpgradePage(),
  '/contacts': (context) => ContactScreen(),
  '/contacts/add': (context) => AddContactPage(),
  '/contacts/info': (context) => ContactInformationPage(),
  '/dates': (context) => DateModule(),
  '/meals/add': (context) => AddMealScreen(),
  '/meals/show': (context) => ShowMealScreen(),
  '/learning': (context) => LearningScreen(),
  '/goals/add': (context) => AddGoalScreen(),
  '/scan': (context) => ScanCard(),
  '/planning': (context) => PlanningList(),
  '/planning/add': (context) => AddPlanning(),
  '/planning/edit': (context) => EditPlanning(),
};
