import 'package:flutter/material.dart';

class Helpers {
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
          ),
        ),
      ),
    );
  }
}

Helpers helpers = Helpers();
