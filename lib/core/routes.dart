import 'package:flutter/material.dart';
import 'package:kronosme/screens/add_contact.dart';
import 'package:kronosme/screens/add_goal.dart';
import 'package:kronosme/screens/contact.dart';
import 'package:kronosme/screens/contact_information.dart';
import 'package:kronosme/screens/dashboard.dart';
import 'package:kronosme/screens/dashboard/container.dart';
import 'package:kronosme/screens/learning.dart';
import 'package:kronosme/screens/login.dart';
import 'package:kronosme/screens/package.dart';
import 'package:kronosme/screens/sign_up.dart';
import 'package:kronosme/screens/signup/screen.dart';
import 'package:kronosme/screens/welcome.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/welcome': (context) => WelcomeScreen(),
  '/package': (context) => PackageScreen(),
  '/signup': (context) => SignupScreen(),
  '/basic_signup': (context) => SignUpPage(),
  '/login': (context) => LoginPage(),
  '/dashboard': (context) => DashboardScreen(),
  '/dashboard/premium': (context) => DashboardPage(),
  '/learning': (context) => LearningScreen(),
  '/contactInformation': (context) => ContactInformationPage(),
  '/addContact': (context) => AddContactPage(),
  '/contactList': (context) => ContactsPage(),
  '/goals/add': (context) => AddGoalScreen(),
};
