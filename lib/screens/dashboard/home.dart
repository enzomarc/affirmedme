import 'package:flutter/material.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/goal_provider.dart';
import 'package:kronosme/providers/module_provider.dart';
import 'package:kronosme/widgets/goal.dart';
import 'package:kronosme/core/models/module.dart';
import 'package:kronosme/widgets/module.dart' as Mod;
import 'package:provider/provider.dart';

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

final List<String> goals = [
  'Mindset',
  'Character',
  'Health',
  'Fitness',
  'Relationships',
  'Finances',
  'Profession',
];

final scaffoldKey = GlobalKey<ScaffoldState>();

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.grey.shade100),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        spreadRadius: 1.0,
                        blurRadius: 10.0,
                        color: Colors.grey.shade200,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.info_outline, color: Color(0xFFFE0000)),
                          SizedBox(width: 10.0),
                          Text(
                            'Daily Tip',
                            style: TextStyle(
                              color: Color(0xFFFE0000),
                              fontFamily: 'Montserrat Bold',
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor eu.',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat Semibold',
                          fontSize: 11.0,
                          height: 2.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '- YOUR NAME HERE',
                            style: TextStyle(
                              fontFamily: 'Montserrat Bold',
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/text_logo.png',
                            height: 24.0,
                          ),
                          Text(
                            'www.affirmedme.com',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'GOALS',
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 16.0,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFFFE0000),
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width,
                  child: Consumer<GoalProvider>(
                    builder: (context, value, child) {
                      return GridView.count(
                        crossAxisCount: MediaQuery.of(context).size.width > 300.0 ? 3 : 2,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(
                          goals.length,
                          (index) {
                            String image = "assets/images/goals/${goals[index].toLowerCase()}.png";

                            return Goal(
                              title: goals[index],
                              assetImage: image,
                              count: value.goals.where((e) => e.objective.toLowerCase() == goals[index].toLowerCase()).length,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'MODULES',
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 16.0,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFFFE0000),
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width,
                  child: Consumer<ModuleProvider>(
                    builder: (context, value, child) {
                      List<Module> modules = value.modules;

                      return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(modules.length, (index) {
                          Map<String, dynamic> params = {
                            'module': modules[index].title,
                          };

                          if (modules[index].title.contains('THINK THROUGH')) {
                            params.addAll({
                              'buttons': Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/planning', arguments: 2);
                                    },
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    color: Colors.black,
                                    child: Text(
                                      'Manage Your Planning',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            });
                          } else if (modules[index].title.contains('MANAGE YOUR')) {
                            params.addAll({
                              'buttons': Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/contacts');
                                    },
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    color: Colors.black,
                                    child: Text(
                                      'Manage Your Network',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/contacts/add');
                                    },
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    color: Colors.black,
                                    child: Text(
                                      'Add Contact',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            });
                          } else if (modules[index].title.contains('EAT WELL')) {
                            params.addAll({
                              'buttons': Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/meals');
                                    },
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    color: Colors.black,
                                    child: Text(
                                      'Manage Meals Plan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      helpers.alert(scaffoldKey, "The grocery list isn't available now.");
                                    },
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    color: Colors.black,
                                    child: Text(
                                      'Grocery List',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            });
                          }
                          // if (modules[index].title.contains('EAT WELL')) {
                          //   params.addAll({
                          //     'btnTitle': 'Add Meal',
                          //     'btnFunc': () {
                          //       Navigator.pushNamed(
                          //         context,
                          //         '/dashboard',
                          //         arguments: 4,
                          //       );
                          //     },
                          //   });
                          // } else if (modules[index].title.contains('MANAGE YOUR')) {
                          //   params.addAll({
                          //     'btnTitle': 'Manage Contacts',
                          //     'btnFunc': () {
                          //       Navigator.pushNamed(
                          //         context,
                          //         '/dashboard',
                          //         arguments: 2,
                          //       );
                          //     }
                          //   });
                          // }

                          return Mod.Module(
                            title: modules[index].title,
                            onTap: () {
                              if (modules[index].title.toLowerCase().contains('remember')) {
                                Navigator.pushNamed(context, '/dates');
                              } else {
                                Navigator.pushNamed(
                                  context,
                                  '/learning',
                                  arguments: params,
                                );
                              }
                            },
                          );
                        }),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/dashboard', arguments: 1);
                      },
                      color: Color(0xFFFE0000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.alarm,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Open Reminder',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat SemiBold',
                              fontSize: 13.0,
                            ),
                          ),
                        ],
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
