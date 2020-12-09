import 'package:flutter/material.dart';
import 'package:kronosme/widgets/goal.dart';
import 'package:kronosme/widgets/module.dart';

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontFamily: 'Montserrat Bold',
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Modules',
                  style: TextStyle(fontFamily: 'Montserrat Medium'),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 130.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Module(
                        title: 'Mindset ou Module ou Goal',
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Objectives',
                  style: TextStyle(fontFamily: 'Montserrat Medium'),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 130.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Goal(
                        title: 'Goal',
                      );
                    },
                  ),
                ),
                SizedBox(height: 50.0),
                Column(
                  children: <Widget>[
                    Text(
                      'Nothing is yet added to your dashboard. Click + button to add more goals.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/goals/add');
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Color(0xFFFE0000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF1789FC),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.info_outline, color: Colors.white),
                          SizedBox(width: 10.0),
                          Text(
                            'Daily Tip',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat Bold',
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor eu. Vitae congue eu consequat ac felis donec. Vel orci porta non pulvinar neque.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat Semibold',
                          fontSize: 11.0,
                          height: 2.0,
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
