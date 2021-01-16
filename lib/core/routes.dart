import 'package:flutter/material.dart';
import 'package:kronosme/screens/contacts/add_contact.dart';
import 'package:kronosme/screens/add_goal.dart';
import 'package:kronosme/screens/contacts/contact.dart';
import 'package:kronosme/screens/contacts/contact_information.dart';
import 'package:kronosme/screens/dashboard/container.dart';
import 'package:kronosme/screens/description.dart';
import 'package:kronosme/screens/learning.dart';
import 'package:kronosme/screens/login.dart';
import 'package:kronosme/screens/meals/add_meal.dart';
import 'package:kronosme/screens/meals/show.dart';
import 'package:kronosme/screens/package.dart';
import 'package:kronosme/screens/planning/add.dart';
import 'package:kronosme/screens/planning/edit.dart';
import 'package:kronosme/screens/planning/list.dart';
import 'package:kronosme/screens/scanCard.dart';
import 'package:kronosme/screens/signup/basic.dart';
import 'package:kronosme/screens/signup/premium.dart';
import 'package:kronosme/screens/upgrade.dart';
import 'package:kronosme/screens/welcome.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/description': (context) => DescriptionPage(),
  '/welcome': (context) => WelcomeScreen(),
  '/package': (context) => PackageScreen(),
  '/signup': (context) => PremiumSignup(),
  '/contacts': (context) => ContactScreen(),
  '/contacts/add': (context) => AddContactPage(),
  '/contacts/info': (context) => ContactInformationPage(),
  '/meals/add': (context) => AddMealScreen(),
  '/meals/show': (context) => ShowMealScreen(),
  '/basic_signup': (context) => BasicSignUp(),
  '/login': (context) => LoginPage(),
  '/dashboard': (context) => DashboardScreen(),
  '/learning': (context) => LearningScreen(),
  '/goals/add': (context) => AddGoalScreen(),
  '/upgrade': (context) => UpgradePage(),
  '/scan': (context) => ScanCard(),
  '/planning': (context) => PlanningList(),
  '/planning/add': (context) => AddPlanning(),
  '/planning/edit': (context) => EditPlanning(),
};
