import 'package:flutter/material.dart';
import 'package:kronosme/screens/add_goal.dart';
import 'screens/dashboard/container.dart';
import 'screens/signup/screen.dart';
import 'screens/welcome.dart';
import 'screens/package.dart';
import 'screens/add_contact.dart';
import 'screens/contact.dart';
import 'screens/contact_information.dart';
import 'screens/dashboard.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/learning.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/package',
      routes: {
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
      },
    );
  }
}
