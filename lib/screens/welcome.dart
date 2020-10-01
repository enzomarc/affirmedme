import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontFamily: 'Montserrat Bold',
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50.0),
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              scale: 12.0,
            ),
            SizedBox(height: 150.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.black87,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'Do it later',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'fontFamily',
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  textColor: Colors.black87,
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Start Now',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'fontFamily',
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xFFFE0000),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
