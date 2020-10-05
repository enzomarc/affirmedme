import 'package:flutter/material.dart';

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

class Module extends StatelessWidget {
  const Module({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      width: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title ?? 'Module',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat Medium',
              fontSize: 14.0,
              color: Color(0xFFFE0000),
            ),
          ),
        ],
      ),
    );
  }
}

class Goal extends StatelessWidget {
  const Goal({
    Key key,
    this.icon,
    this.title,
    this.count,
    this.countColor = const Color(0xFFFE0000),
  }) : super(key: key);

  final IconData icon;
  final String title;
  final int count;
  final Color countColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              width: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon ?? Icons.accessible,
                    color: Color(0xFFFE0000),
                    size: 48.0,
                  ),
                ],
              ),
            ),
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: countColor,
                borderRadius: BorderRadius.circular(500.0),
              ),
              child: Center(
                child: Text(
                  count ?? '0',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          title ?? 'Goal',
          style: TextStyle(
            fontFamily: 'Montserrat Bold',
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
