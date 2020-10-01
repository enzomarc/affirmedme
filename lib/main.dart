import 'package:flutter/material.dart';
import 'screens/signup/screen.dart';
import 'screens/welcome.dart';
import 'screens/package.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/package': (context) => PackageScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
