import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFFFFFFF)));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 50.0,
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: 500.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFFE0000),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Basic\'s features',
                          style: TextStyle(
                            fontFamily: 'Montserrat Bold',
                            fontSize: 15.0,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 120.0,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => PackageItem(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 135.0,
                        height: 135.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Montserrat Bold',
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          TextFormField(
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
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
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
                          SizedBox(height: 10.0),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
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
                          SizedBox(
                            height: 25.0,
                          ),
                          RaisedButton(
                            color: Color(0xFFFE0000),
                            padding: EdgeInsets.only(
                                left: 105.0,
                                right: 105.0,
                                top: 20.0,
                                bottom: 20.0),
                            onPressed: () {
                              Navigator.pushNamed(context, '/dashboard');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Montserrat Bold',
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PackageItem extends StatelessWidget {
  const PackageItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 5.0,
            left: 5.0,
          ),
          width: 100.0,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ],
    );
  }
}
