import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  /// Show an alert using the snackbar
  /// of the current showed Scaffold.
  void alert(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 1.0,
        content: Text(
          message ?? "random content",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat Semibold",
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }

  /// Open SMS App with `phone` as receiver.
  /// You can only set `content` on Android.
  void sendSMS(String phone, {String content}) async {
    final Uri uri = Uri(
      scheme: 'sms',
      path: phone,
      queryParameters: {
        'body': content,
      },
    );

    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    }
  }

  /// Open phone call app with `phone` as number.
  void makeCall(String phone) async {
    final String uri = "tel:$phone";

    if (await canLaunch(uri)) await launch(uri);
  }

  /// Open default mail app with `email` as receiver,
  /// and `content` as body.
  void sendMail(String email, {String subject, String content}) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': content,
      },
    );

    if (await canLaunch(uri.toString())) await launch(uri.toString());
  }
}

Helpers helpers = Helpers();
