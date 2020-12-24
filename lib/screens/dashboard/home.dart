import 'package:flutter/material.dart';
import 'package:kronosme/providers/goal_provider.dart';
import 'package:kronosme/services/module_service.dart';
import 'package:kronosme/widgets/goal.dart';
import 'package:kronosme/core/models/module.dart';
import 'package:kronosme/widgets/module.dart' as Mod;
import 'package:provider/provider.dart';

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

List<Module> modules = [];
final List<String> goals = [
  'Mindset',
  'Character',
  'Health',
  'Fitness',
  'Relationships',
  'Finances',
  'Profession',
];

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    modules = moduleService.modules;

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
                    itemCount: modules.length,
                    itemBuilder: (context, index) {
                      return Mod.Module(
                        title: modules[index].title,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/learning',
                            arguments: modules[index].title,
                          );
                        },
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
                  child: Consumer<GoalProvider>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: goals.length,
                        itemBuilder: (context, index) {
                          return Goal(
                            title: goals[index],
                            count: value.goals
                                .where((e) =>
                                    e.objective.toLowerCase() ==
                                    goals[index].toLowerCase())
                                .length,
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Click + button to add more goals.',
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
