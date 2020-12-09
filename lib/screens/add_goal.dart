import 'package:flutter/material.dart';

class AddGoalScreen extends StatefulWidget {
  @override
  _AddGoalScreenState createState() => _AddGoalScreenState();
}

int goals = 3;

class _AddGoalScreenState extends State<AddGoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 400.0,
                      width: 370.0,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2.0,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 55.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'MINDSET',
                              style: TextStyle(
                                fontFamily: 'Montserrat Bold',
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Expanded(
                              flex: 6,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: goals,
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      filled: true,
                                      hintText:
                                          "Goal ${(index + 1).toString()}",
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat Medium',
                                        fontSize: 13.0,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                        horizontal: 15.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(500.0),
                                        borderSide: BorderSide(
                                          width: 0.0,
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(500.0),
                                        borderSide: BorderSide(
                                          width: 0.0,
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(500.0),
                                        borderSide: BorderSide(
                                          width: 0.0,
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Expanded(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(500.0),
                                ),
                                color: Colors.grey.shade200,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                  vertical: 10.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    goals++;
                                  });
                                },
                                child: Text(
                                  'add objective',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80.0,
                      width: 80.0,
                      margin: EdgeInsets.only(bottom: 400.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1.0,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '1/7',
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          fontWeight: FontWeight.w900,
                          fontSize: 17.0,
                          color: Color(0xFFFE0000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
