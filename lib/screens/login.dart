import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFE0000)));

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/login_bg.png'),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/me.png',
                    height: 80.0,
                    width: 80.0,
                  ),
                  height: 150.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  height: 525.0,
                  width: 500.0,
                  margin: EdgeInsets.only(
                    top: 20.0,
                    left: 25.0,
                    right: 25.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'MontBold',
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Fill your name and your password',
                              style: TextStyle(
                                fontFamily: 'MontRegular',
                                fontSize: 15.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                        ),
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12.0,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: 'MontBold',
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: 'Username, Email or Phone',
                                  labelStyle: TextStyle(
                                    fontFamily: 'MontRegular',
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 10.0,
                              ),
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              child: TextField(
                                obscureText: true,
                                controller: passController,
                                decoration: InputDecoration(
                                  labelText: '********',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontFamily: 'MontRegular',
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    print('Forgot password');
                                  });
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    fontFamily: 'MontRegular',
                                    fontSize: 13.0,
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: RaisedButton(
                                color: Color(0xFFFE0000),
                                padding: EdgeInsets.only(
                                    left: 105.0,
                                    right: 105.0,
                                    top: 20.0,
                                    bottom: 20.0),
                                onPressed: () {
                                  setState(() {
                                    print('Submit Button');
                                  });
                                },
                                child: Text(
                                  'Sign In Now',
                                  style: TextStyle(
                                      fontFamily: 'MontRegular',
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
                    left: 25.0,
                    right: 25.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account?',
                        style: TextStyle(
                          fontFamily: 'MontRegular',
                          fontSize: 13.0,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/signup');
                          });
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'MontBold',
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
