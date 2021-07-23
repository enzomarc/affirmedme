import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/services/auth_service.dart';
import 'package:kronosme/services/payment_service.dart';

class UpgradePage extends StatefulWidget {
  @override
  _UpgradePageState createState() => _UpgradePageState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController cardNumber = TextEditingController();
TextEditingController exp = TextEditingController();
TextEditingController cvc = TextEditingController();

class _UpgradePageState extends State<UpgradePage> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/me.png',
                      height: 70.0,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'Transform your life with these new modules :',
                      style: TextStyle(
                        fontFamily: 'Montserrat SemiBold',
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Dicovery learning',
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Think through actions',
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Learn reflect and keep good notes',
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Practice self discipline',
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Remember the important dates',
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                        title: Text(
                          'Go to Premium',
                          style: TextStyle(
                            fontFamily: 'Montserrat Bold',
                            fontSize: 14.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        children: <Widget>[
                          TextFormField(
                            controller: cardNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.credit_card),
                              labelText: 'Card Number',
                              hintText: '4242 4242 4242 4242',
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
                            controller: exp,
                            decoration: InputDecoration(
                              hintText: '10/21',
                              labelText: 'Expiration date',
                              helperText: 'MM/YY',
                              helperStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
                            controller: cvc,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '444',
                              labelText: 'CVC',
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 15.0,
                              ),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              onPressed: () async {
                                if (cardNumber.text.isEmpty || exp.text.isEmpty || cvc.text.isEmpty) {
                                  helpers.alert(scaffoldKey, "All fields are required.");
                                } else {
                                  Map<String, dynamic> cardData = {
                                    'number': cardNumber.text,
                                    'exp': exp.text,
                                    'cvc': cvc.text,
                                  };

                                  var paymentMethod = await paymentService.createCard(cardData);

                                  if (paymentMethod != false) {
                                    var payment = await paymentService.createPayment();

                                    if (payment != false) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          contentPadding: EdgeInsets.all(20.0),
                                          titlePadding: EdgeInsets.all(20.0),
                                          actionsPadding: EdgeInsets.all(20.0),
                                          title: Text(
                                            'Payment Request',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat Bold',
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "You're going to make a payment to confirm your subscription to premium plan on AffirmedMe.",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat Semibold',
                                                  fontSize: 13.0,
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Text(
                                                "Amount: \$9.99",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat Bold',
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            FlatButton(
                                              onPressed: () async {
                                                var confirmedPayment = await paymentService.confirmPayment(payment['payment_id'], paymentMethod);

                                                if (confirmedPayment != false) {
                                                  await auth.upgradeAccount(cardData, confirmedPayment['_id']);
                                                  await auth.logout();

                                                  Navigator.pop(context);
                                                } else {
                                                  helpers.alert(scaffoldKey, "Unable to confirm your payment request, retry later.");
                                                }
                                              },
                                              color: Colors.green[600],
                                              textColor: Colors.white,
                                              child: Text('Confirm Payment'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      helpers.alert(scaffoldKey, "Unable to create payment request, retry later.");
                                    }
                                  } else {
                                    helpers.alert(scaffoldKey, "Unable to verify your card informations, retry later.");
                                  }
                                }
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
                              child: Text(
                                'Proceed payment',
                                style: TextStyle(
                                  fontFamily: 'Montserrat Medium',
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  padding: EdgeInsets.all(15.0),
                  color: Color(0xFFFE0000),
                  child: Text(
                    'Upgrade now',
                    style: TextStyle(
                      fontFamily: 'Montserrat Bold',
                      color: Color(0xFFFFFFFF),
                    ),
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
