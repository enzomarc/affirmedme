import 'package:flutter/material.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/meal_plan_provider.dart';
import 'package:kronosme/services/meal_plan_service.dart';
import 'package:provider/provider.dart';

class AddMealScreen extends StatefulWidget {
  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

List<String> meals = [];
TextEditingController title = TextEditingController();
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _AddMealScreenState extends State<AddMealScreen> {
  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealPlanProvider>(context, listen: false);
    String group = ModalRoute.of(context).settings.arguments;

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
          'Add Meal Plan',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat Bold',
            fontSize: 13.0,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 40.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: title,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Meal Plan Title',
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Meals',
                  style: TextStyle(
                    fontFamily: 'Montserrat Bold',
                    fontSize: 20.0,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      meals.add('');
                    });
                  },
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add_box,
                        color: Color(0xFFFE0000),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Add meal',
                        style: TextStyle(
                          color: Color(0xFFFE0000),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 2.0,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFE0000).withOpacity(0.5),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      initialValue: meals[index] ?? 'tom',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Meal Title',
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
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
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              meals.removeAt(index);
                            });
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          meals[index] = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () async {
                      if (title.text.isNotEmpty && group != null) {
                        Map<String, dynamic> data = {'group': group, 'title': title.text, 'meals': meals};

                        await mealPlanService.storeMealPlan(data).then((stored) {
                          if (stored) {
                            setState(() {
                              meals = [];
                              title.text = '';
                            });

                            helpers.alert(scaffoldKey, "Meal plan added successfully.");
                            mealProvider.getMealPlans();
                          } else {
                            helpers.alert(scaffoldKey, "Unable to add the meal plan.");
                          }
                        }).catchError((err) {
                          print(err);
                          helpers.alert(scaffoldKey, "Unable to add the meal plan.");
                        });
                      } else {
                        helpers.alert(scaffoldKey, "Meal plan title and day are required.");
                      }
                    },
                    color: Color(0xFFFE0000),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.file_download,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Create the meal plan',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
