import 'package:flutter/material.dart';
import 'package:kronosme/core/models/meal_plan.dart';

class ShowMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MealPlan mealPlan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  mealPlan.title ?? 'Meal Plan',
                  style: TextStyle(
                    fontFamily: 'Montserrat Bold',
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Text(
                      "${mealPlan.meals.length} meals",
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 20.0,
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
                SizedBox(height: 20.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: mealPlan.meals.length,
                    itemBuilder: (context, index) {
                      String meal = mealPlan.meals[index];

                      return Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.only(bottom: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          meal ?? 'Some meal',
                          style: TextStyle(
                            fontFamily: 'Montserrat Medium',
                            fontSize: 12.0,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
