import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFFFFFFF)));

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final List<String> modules = [
      'DISCOVERY LEARNING',
      'THINK THROUGH ACTIONS',
      'ROUTINE OF THE GREATS',
      'LEARN REFFLECT AND KEEP GOOD NOTES',
      'PRACTICE SELF DISCIPLINE',
      'MANAGE YOUR NETWORK',
      'REMEMBER THE IMPORTANT DATES',
      'EAT WELL TO FEEL GREAT',
    ];

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
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
                            itemCount: modules.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                PackageItem(title: modules[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
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
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Name',
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
                              controller: phoneController,
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
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: confirmPassController,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color: Color(0xFFFE0000),
                                  padding: EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                      top: 20.0,
                                      bottom: 20.0),
                                  onPressed: () async {
                                    var msg = "";

                                    if (nameController.text.isEmpty ||
                                        mailController.text.isEmpty ||
                                        phoneController.text.isEmpty ||
                                        passController.text.isEmpty) {
                                      msg = "All fields are required.";
                                    } else {
                                      if (passController.text ==
                                          confirmPassController.text) {
                                        Map<String, dynamic> data = {
                                          'name': nameController.text,
                                          'email': mailController.text,
                                          'phone': phoneController.text,
                                          'password': passController.text,
                                        };

                                        await auth
                                            .register(data)
                                            .then((res) {
                                          if (res == false) {
                                            msg =
                                                "An error occurred, unable to register.";
                                          }
                                        }).catchError((error) {
                                          print(error);
                                          msg =
                                              "An error occurred, unable to register.";
                                        });
                                      } else {
                                        msg = "Password doesn't match.";
                                      }
                                    }

                                    if (msg != "")
                                      helpers.alert(scaffoldKey, msg);
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat Bold',
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  color: Color(0xFFFFFFFF),
                                  padding: EdgeInsets.only(
                                    left: 30.0,
                                    right: 30.0,
                                    top: 20.0,
                                    bottom: 20.0,
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat Bold',
                                      color: Color(0xFFFE0000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 5.0,
            left: 5.0,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          width: 100.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            title ?? "Something",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat Medium',
              fontSize: 14.0,
              color: Color(0xFFFE0000),
            ),
          ),
        ),
      ],
    );
  }
}
