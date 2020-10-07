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
                  'Tableau de bord',
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
                  'Objectifs',
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
                      'Nothing is yet added to your dashboard. Click + button to add more tasks.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    FlatButton(
                      onPressed: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
