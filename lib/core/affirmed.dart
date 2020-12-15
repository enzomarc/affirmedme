import 'package:flutter/material.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/core/routes.dart';
import 'package:kronosme/core/utils/constants.dart';

class Affirmed extends StatelessWidget {
  final String defaultRoute;

  Affirmed(this.defaultRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      routes: routes,
      initialRoute: defaultRoute,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: worker.navigatorKey,
    );
  }
}
