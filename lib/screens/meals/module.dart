import 'package:flutter/material.dart';
import 'package:kronosme/core/models/meal_plan.dart';
import 'package:kronosme/providers/meal_plan_provider.dart';
import 'package:provider/provider.dart';

class MealModule extends StatefulWidget {
  @override
  _MealModuleState createState() => _MealModuleState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
List<String> groups = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
List<bool> expanded = [false, false, false, false, false, false, false];

class _MealModuleState extends State<MealModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFFE0000),
            size: 20.0,
          ),
        ),
        title: Text(
          'Eat Well To Feel Great',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat Bold',
            fontSize: 13.0,
          ),
        ),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.blue.shade400,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                  title: Text('Instruction'),
                  titlePadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                  children: <Widget>[
                    Text(
                      "Review the information below and put it into your calendar application. You may use the recommended timelines or change them to fit your life. Set the alarm function for each event to remind you of the upcoming event two weeks before it’s due for completion. For bigger events requiring longer planning, set the alarm function a couple of months before (example: planning a vacation or planning a dinner party). Once you have everything set in your calendar,in order to make sure your planning works, you must review the calendar often. Every week, take time to review the next two or three months to ensure you start thinking through planning considerations and coordination. Consider using the AR-TEC-ARC-D model to think through all actions, activities, and events. Memorize the model to have a quick mental checklist you can use that will force you to plan from multiple angles. Remember, you can also use this model for individual actions such as driving to work or simply just thinking through your day.",
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: <Widget>[
                Consumer<MealPlanProvider>(
                  builder: (context, provider, child) {
                    List<MealPlan> meals = provider.meals;

                    return Expanded(
                      child: ListView.builder(
                        itemCount: groups.length,
                        itemBuilder: (context, index) {
                          String group = groups[index];
                          List<MealPlan> groupMeals = meals.where((meal) => meal.group.toLowerCase() == group.toLowerCase()).toList();

                          return Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      expanded[index] = !expanded[index];
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        expanded[index] ? Icons.arrow_drop_down : Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Text(
                                          group,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat Bold',
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                if (expanded[index])
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      children: <Widget>[
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: groupMeals.length,
                                          itemBuilder: (context, index) {
                                            MealPlan tmpMeal = groupMeals[index];

                                            return Container(
                                              margin: EdgeInsets.only(bottom: 10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    tmpMeal.title ?? 'Meal Plan',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat SemiBold',
                                                      fontSize: 14.0,
                                                    ),
                                                  ), // meal plan title
                                                  SizedBox(height: 5.0),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 5.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: tmpMeal.meals
                                                          .map(
                                                            (e) => Column(
                                                              children: <Widget>[
                                                                Text(
                                                                  e,
                                                                  style: TextStyle(
                                                                    fontFamily: 'Montserrat Medium',
                                                                    fontSize: 13.0,
                                                                  ),
                                                                ),
                                                                SizedBox(height: 5.0),
                                                              ],
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(height: 10.0),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context, '/meals/add', arguments: group);
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.add_circle_outline,
                                                color: Color(0xFFFE0000),
                                                size: 14.0,
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                'Add Meal Plan',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat SemiBold',
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  Container()
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
