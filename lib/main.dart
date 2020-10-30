import 'package:flutter/material.dart';
import 'package:kronosme/screens/add_contact.dart';
import 'package:kronosme/screens/contact.dart';
import 'package:kronosme/screens/contact_information.dart';
import 'package:kronosme/screens/dashboard.dart';
import 'package:kronosme/screens/login.dart';
import 'package:kronosme/screens/sign_up.dart';
import 'package:kronosme/screens/learning.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/basic_signup': (context) => SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
        '/learning': (context) => LearningScreen(),
        '/contactInformation': (context) => ContactInformationPage(),
        '/addContact': (context) => AddContactPage(),
        '/contactList': (context) => ContactsPage(),
      },
    );
  }
}
