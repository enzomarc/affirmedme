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
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Writing your GOALS and IDEAS and ACTIONING them. The chances of you completing your GOALS them up significantly if you write it down.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat Semibold',
                  fontSize: 11.0,
                ),
              ),
            ),
            SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/dashboard');
                  },
                  textColor: Colors.black87,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'Do it later',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Motserrat Medium',
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/goals/add');
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
                          fontFamily: 'Montserrat SemiBold',
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
