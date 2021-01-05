import 'package:flutter/material.dart';
import 'package:kronosme/core/models/meal_plan.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/meal_plan_provider.dart';
import 'package:kronosme/services/meal_plan_service.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<MealScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealPlanProvider>(context, listen: false);
    mealProvider.getMealPlans();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            margin: EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Meal Plans',
                  style: TextStyle(
                    fontFamily: 'Montserrat Bold',
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  width: 170.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/meals/add');
                    },
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.add_box,
                          color: Color(0xFFFE0000),
                          size: 20.0,
                        ),
                        Text(
                          'Add Meal Plan',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFFFE0000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<MealPlanProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView.builder(
                      itemCount: provider.meals.length,
                      itemBuilder: (context, index) {
                        MealPlan mealPlan = provider.meals[index];

                        return MealWidget(
                          meal: mealPlan,
                          scaffoldKey: scaffoldKey,
                        );
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MealWidget extends StatelessWidget {
  const MealWidget({
    Key key,
    @required this.meal,
    @required this.scaffoldKey,
  }) : super(key: key);

  final MealPlan meal;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    MealPlanProvider mealPlanProvider = Provider.of<MealPlanProvider>(context, listen: false);

    return Dismissible(
      key: Key(meal.id.toString()),
      onDismissed: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          await mealPlanService.deleteMealPlan(meal.id).then((deleted) {
            if (deleted) {
              helpers.alert(scaffoldKey, "Meal plan deleted successfully.");
              mealPlanProvider.getMealPlans();
            }
          });
        }
      },
      background: Container(
        color: Colors.red.shade400,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          'Delete',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat Bold',
            fontSize: 12.0,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/meals/show', arguments: meal);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          width: double.infinity,
          margin: EdgeInsets.only(
            bottom: 5.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                meal.title ?? 'Meal label',
                style: TextStyle(
                  fontFamily: 'Montserrat Semibold',
                  fontSize: 13.0,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.list,
                    color: Color(0xFFFE0000),
                    size: 12.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "${meal.meals.length} meals" ?? '0 meal',
                    style: TextStyle(
                      color: Color(0xFFFE0000),
                      fontFamily: 'Montserrat Medium',
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
