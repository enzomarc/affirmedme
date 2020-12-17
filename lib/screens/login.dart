import 'package:flutter/material.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/services/auth_service.dart';

final TextEditingController mailController = TextEditingController();
final TextEditingController passController = TextEditingController();
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/me_light.png",
                    scale: 12.0,
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5.0,
                        blurRadius: 10.0,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Montserrat Bold',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Fill your name and your password',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: 'Montserrat Bold',
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: mailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xFFFE0000).withOpacity(0.4),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xFFFE0000).withOpacity(0.4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xFFFE0000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xFFFE0000).withOpacity(0.4),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xFFFE0000).withOpacity(0.4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xFFFE0000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      GestureDetector(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        onPressed: () async {
                          if (mailController.text.isEmpty ||
                              passController.text.isEmpty) {
                            helpers.alert(scaffoldKey,
                                "Email and password are required.");
                          } else {
                            await auth
                                .login(mailController.text, passController.text)
                                .then((value) {
                              if (value == false) {
                                helpers.alert(scaffoldKey,
                                    "Email or password are invalid.");
                              }
                            }).catchError((err) {
                              print(err);
                              helpers.alert(scaffoldKey,
                                  "Email or password are invalid.");
                            });
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                        color: Color(0xFFFE0000),
                        child: Text(
                          'Sign in now',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontFamily: 'Montserrat Medium'),
                    ),
                    SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/package');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'Montserrat Semibold',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
