import 'package:flutter/material.dart';
import 'package:kronosme/core/models/objective.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/goal_provider.dart';
import 'package:kronosme/services/goal_service.dart';
import 'package:provider/provider.dart';

class AddGoalScreen extends StatefulWidget {
  @override
  _AddGoalScreenState createState() => _AddGoalScreenState();
}

List<String> objectives = [
  'MINDSET',
  'CHARACTER',
  'HEALTH',
  'FITNESS',
  'RELATIONSHIPS',
  'FINANCES',
  'PROFESSION',
];

Map<String, List<String>> goals = {};
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _AddGoalScreenState extends State<AddGoalScreen> {
  @override
  void initState() {
    final goalProvider = Provider.of<GoalProvider>(context, listen: false);
    List<Objective> tmp = goalProvider.goals;

    objectives.forEach((objective) {
      objective = objective.toLowerCase();
      goals[objective] = [];
    });

    if (tmp.length > 0) {
      tmp.forEach((goal) {
        goals[goal.objective].add(goal.content);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            physics: PageScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: objectives.length,
                            itemBuilder: (context, index) {
                              String objective = objectives[index].toLowerCase();

                              return Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 400.0,
                                    width: MediaQuery.of(context).size.width - 40.0,
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
                                            objectives[index],
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
                                              itemCount: goals[objective].length,
                                              itemBuilder: (context, index) {
                                                String value = "";

                                                if (goals[objective].length > 0) {
                                                  value = goals[objective][index].isNotEmpty ? goals[objective][index] : "";
                                                } else {
                                                  value = "";
                                                }

                                                TextEditingController goalController = TextEditingController(text: value);

                                                return Container(
                                                  margin: EdgeInsets.only(bottom: 10.0),
                                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                                  child: TextFormField(
                                                    controller: goalController,
                                                    textInputAction: TextInputAction.done,
                                                    onFieldSubmitted: (value) => goals[objective][index] = value,
                                                    decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: Icon(
                                                          Icons.close,
                                                        ),
                                                        onPressed: () => goals[objective].removeAt(index),
                                                      ),
                                                      fillColor: Colors.grey.withOpacity(0.2),
                                                      filled: true,
                                                      hintText: "Goal ${(index + 1).toString()}",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Montserrat Medium',
                                                        fontSize: 13.0,
                                                      ),
                                                      contentPadding: const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 15.0,
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(500.0),
                                                        borderSide: BorderSide(
                                                          width: 0.0,
                                                          color: Colors.grey.withOpacity(0.2),
                                                        ),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(500.0),
                                                        borderSide: BorderSide(
                                                          width: 0.0,
                                                          color: Colors.grey.withOpacity(0.2),
                                                        ),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(500.0),
                                                        borderSide: BorderSide(
                                                          width: 0.0,
                                                          color: Colors.grey.withOpacity(0.2),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
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
                                                  goals[objective].add("");
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
                                      "${index + 1}/${objectives.length}",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat Bold',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17.0,
                                        color: Color(0xFFFE0000),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      Container(
                        width: 130.0,
                        margin: EdgeInsets.only(bottom: 50.0),
                        child: RaisedButton(
                          color: Color(0xFFFE0000),
                          onPressed: () async {
                            await goalService.storeGoal(goals).then((added) {
                              if (added) {
                                Navigator.popAndPushNamed(context, '/dashboard');
                              } else {
                                helpers.alert(scaffoldKey, "Unable to save your goals.");
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ],
                          ),
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
