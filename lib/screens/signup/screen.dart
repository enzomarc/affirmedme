import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int currentStep = 0;
  bool complete = false;

  next() {
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
      isActive: true,
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
              SizedBox(height: 30.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    //
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
      isActive: false,
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Card',
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '12/06',
                        labelText: 'Expiration day',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '000',
                        labelText: 'CVV',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    //
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
      title: const Text('General'),
      isActive: false,
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
                'Email: emarc237@gmail.com',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Name: Marc Enzo',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Total Payment: \$69',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 80.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    //
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
                    'Confirm payment',
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
      appBar: AppBar(
        backgroundColor: Color(0xFFFE0000),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Premium Features',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: -0.5,
            fontFamily: 'Montserrat Bold',
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
