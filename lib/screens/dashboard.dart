import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/widgets/objectif_container.dart';
import 'package:kronosme/widgets/slot_container.dart';
import 'package:kronosme/widgets/task_container.dart';
import 'package:kronosme/widgets/time_container.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int notifCounter = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFFFFFF)));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFFFE0000),
          ),
          onPressed: () {
            setState(() {
              print('The menu btn');
            });
          },
        ),
        title: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        print(' The account Btn');
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 30.0,
                          color: Color(0xFFFE0000),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(
                                'Hi John Doe',
                                style: TextStyle(
                                  fontFamily: 'MontRegular',
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                'Premium package',
                                style: TextStyle(
                                  fontFamily: 'MontBold',
                                  fontSize: 10.0,
                                  color: Color(0xFF59B306),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          size: 30.0,
                          color: Color(0xFF7C7373),
                        ),
                        onPressed: () {
                          print('Notification');
                        },
                      ),
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: Icon(
                          Icons.brightness_1,
                          color: Color(0xFFFE0000),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 17.0,
            right: 17.0,
            top: 17.0,
          ),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontFamily: 'MontBold',
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Modules',
                        style: TextStyle(
                          fontFamily: 'MontRegular',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: Container(
                    width: 500.0,
                    height: 140.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Tasks_Container(
                          taskname: 'Tomorrow it\'s another day',
                          taskcolor: Colors.red[500].withOpacity(0.7),
                        ),
                        Tasks_Container(
                          taskname: 'Tomorrow it\'s another day',
                          taskcolor: Colors.green[500].withOpacity(0.7),
                        ),
                        Tasks_Container(
                          taskname: 'Tomorrow it\'s another day',
                          taskcolor: Colors.red[500].withOpacity(0.7),
                        ),
                        Tasks_Container(
                          taskname: 'Tomorrow it\'s another day',
                          taskcolor: Colors.green[500].withOpacity(0.7),
                        ),
                        Tasks_Container(
                          taskname: 'Tomorrow it\'s another day',
                          taskcolor: Colors.red[500].withOpacity(0.7),
                        ),
                        Tasks_Container(
                          taskname: 'Tomorrow it\'s another day',
                          taskcolor: Colors.green[500].withOpacity(0.7),
                        ),
                        Tasks_Container(
                          taskname: 'Tomorrow it\'s another day',
                          taskcolor: Colors.red[500].withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Objective',
                  style: TextStyle(
                    fontFamily: 'MontRegular',
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    height: 110.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Objectif_Container(
                          title: 'Mindset',
                          countColor: Colors.red[500].withOpacity(0.8),
                        ),
                        Objectif_Container(
                          title: 'Mindset',
                          countColor: Colors.green[500].withOpacity(0.8),
                        ),
                        Objectif_Container(
                          title: 'Mindset',
                          countColor: Colors.red[500].withOpacity(0.8),
                        ),
                        Objectif_Container(
                          title: 'Mindset',
                          countColor: Colors.green[500].withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Objective',
                  style: TextStyle(
                    fontFamily: 'MontRegular',
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 300.0,
                  width: 300.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Choose your slot',
                                      style: TextStyle(
                                        fontFamily: 'MontBold',
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.select_all,
                                  color: Colors.grey[500],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Slot_Container(),
                                Slot_Container(),
                                Slot_Container(),
                                Slot_Container(),
                                Slot_Container(),
                                Slot_Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Morning',
                                  style: TextStyle(
                                    fontFamily: 'MontBold',
                                    color: Colors.grey[500],
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Time_Container(
                                  hour: '09:00 am',
                                ),
                                Time_Container(
                                  hour: '09:30 am',
                                ),
                                Time_Container(
                                  hour: '10:30 am',
                                ),
                                Time_Container(
                                  hour: '11:00 am',
                                ),
                                Time_Container(
                                  hour: '11:30 am',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Afternoon',
                                  style: TextStyle(
                                    fontFamily: 'MontBold',
                                    color: Colors.grey[500],
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Time_Container(
                                  hour: '09:00 am',
                                ),
                                Time_Container(
                                  hour: '09:30 am',
                                ),
                                Time_Container(
                                  hour: '10:30 am',
                                ),
                                Time_Container(
                                  hour: '11:00 am',
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Color(0xFFFE0000),
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        Navigator.pushNamed(
                                            context, '/contactInformation');
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Evening',
                                  style: TextStyle(
                                    fontFamily: 'MontBold',
                                    color: Colors.grey[500],
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Time_Container(
                                  hour: '09:00 am',
                                ),
                                Time_Container(
                                  hour: '09:30 am',
                                ),
                                Time_Container(
                                  hour: '10:30 am',
                                ),
                                Time_Container(
                                  hour: '11:00 am',
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Color(0xFFFE0000),
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        Navigator.pushNamed(
                                            context, '/learning');
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
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
