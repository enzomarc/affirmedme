import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/screens/signup/steps/complete.dart';
import 'package:kronosme/screens/signup/steps/payment.dart';
import 'steps/general.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFE0000),
      ),
    );

    return Scaffold(
      body: SafeArea(
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
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Premium Features',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: -0.5,
                            fontFamily: 'Montserrat Bold',
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$59',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat Bold',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.only(right: 10.0, left: 10.0),
                          width: 100.0,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            Expanded(
              child: Theme(
                data: ThemeData(primaryColor: Color(0xFFFE0000)),
                child: Stepper(
                  controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                    return Container();
                  },
                  type: StepperType.horizontal,
                  steps: [
                    generalStep,
                    paymentStep,
                    completeStep,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
