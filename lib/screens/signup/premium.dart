import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/services/auth_service.dart';
import 'package:kronosme/services/payment_service.dart';

class PremiumSignup extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController mailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmPassController = TextEditingController();
TextEditingController cardNumber = TextEditingController();
TextEditingController exp = TextEditingController();
TextEditingController cvc = TextEditingController();

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
Map<String, dynamic> data = {};
List<StepState> stepStates = [
  StepState.editing,
  StepState.disabled,
  StepState.disabled,
];
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

class _SignupScreenState extends State<PremiumSignup> {
  int currentStep = 0;
  bool complete = false;

  next() {
    setState(() => stepStates[currentStep] = StepState.complete);

    currentStep + 1 != 3
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFE0000),
      ),
    );

    Step generalStep = Step(
      title: const Text('General'),
      isActive: currentStep == 0,
      state: stepStates[0],
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 30.0),
              Form(
                child: Column(
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
                      if (passController.text == confirmPassController.text) {
                        setState(() {
                          data.addAll({
                            'name': nameController.text,
                            'email': mailController.text,
                            'phone': phoneController.text,
                            'password': passController.text,
                          });
                        });

                        next();
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
                        'Next Step',
                        style: TextStyle(
                          fontFamily: 'Montserrat Medium',
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    Step paymentStep = Step(
      title: const Text('Payment'),
      isActive: currentStep == 1,
      state: stepStates[1],
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Payment',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 30.0),
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
                    if (cardNumber.text.isEmpty ||
                        exp.text.isEmpty ||
                        cvc.text.isEmpty) {
                      helpers.alert(scaffoldKey, cvc.text);
                    } else {
                      Map<String, dynamic> cardData = {
                        'number': cardNumber.text,
                        'exp': exp.text,
                        'cvc': cvc.text,
                      };

                      var paymentMethod =
                          await paymentService.createCard(cardData);

                      if (paymentMethod != false) {
                        var payment = await paymentService.createPayment();

                        if (payment != false) {
                          showDialog(
                            context: context,
                            child: AlertDialog(
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
                                    var confirmedPayment =
                                        await paymentService.confirmPayment(
                                            payment['payment_id'],
                                            paymentMethod);

                                    if (confirmedPayment != false) {
                                      data.addAll({
                                        'premium': true,
                                        'card': cardData,
                                        'payment': confirmedPayment['_id'],
                                      });

                                      Navigator.pop(context);
                                      next();
                                    } else {
                                      helpers.alert(scaffoldKey,
                                          "Unable to confirm your payment request, retry later.");
                                    }
                                  },
                                  color: Colors.green[700],
                                  textColor: Colors.white,
                                  child: Text('Confirm Payment'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          helpers.alert(scaffoldKey,
                              "Unable to create payment request, retry later.");
                        }
                      } else {
                        helpers.alert(scaffoldKey,
                            "Unable to verify your card informations, retry later.");
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
        ),
      ),
    );
    Step confirmationStep = Step(
      title: const Text('Confirmation'),
      isActive: currentStep == 2,
      state: stepStates[2],
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Confirmation details',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Email: ${data['email']}",
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Name: ${data['name']}",
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Total Payment: \$9.99',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 80.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () async {
                    await auth.register(data).then((res) {
                      if (res == false) {
                        helpers.alert(scaffoldKey,
                            "An error occurred, unable to register.");
                      }
                    }).catchError((err) {
                      print(err);
                      helpers.alert(scaffoldKey,
                          "An error occurred, unable to register.");
                    });
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
                    'Create your account',
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
        ),
      ),
    );

    List<Step> steps = [generalStep, paymentStep, confirmationStep];

    return Scaffold(
      key: scaffoldKey,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Premium Package',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat Bold',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$9.99',
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
            Expanded(
              child: Theme(
                data: ThemeData(primaryColor: Color(0xFFFE0000)),
                child: Stepper(
                  controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                    return Container();
                  },
                  currentStep: currentStep,
                  onStepContinue: next,
                  onStepCancel: cancel,
                  onStepTapped: goTo,
                  type: StepperType.horizontal,
                  steps: steps,
                ),
              ),
            ),
          ],
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
