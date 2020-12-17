import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/services/auth_service.dart';

class BasicSignUp extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController mailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmPassController = TextEditingController();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _SignupScreenState extends State<BasicSignUp> {
  @override
  Widget build(BuildContext context) {
    final List<String> modules = [
      'ROUTINE OF THE GREATS',
      'MANAGE YOUR NETWORK',
      'EAT WELL TO FEEL GREAT',
    ];

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFE0000),
                  ),
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Basic Package',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat Bold',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Free',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat Bold',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: modules.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              PackageItem(title: modules[index]),
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 220.0,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                              hintText: 'Phone number',
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
                              hintText: 'Confirm password',
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
                        ],
                      ),
                      SizedBox(height: 30.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () async {
                            String msg = "";

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

                                await auth.register(data).then((res) {
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

                            if (msg != "") helpers.alert(scaffoldKey, msg);
                          },
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50.0,
                            vertical: 15.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          color: Color(0xFFFE0000),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Create your account',
                                style: TextStyle(
                                  fontFamily: 'Montserrat Medium',
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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
