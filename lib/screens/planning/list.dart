import 'package:flutter/material.dart';
import 'package:kronosme/core/models/planning.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/planning_provider.dart';
import 'package:kronosme/screens/planning/add.dart';
import 'package:kronosme/services/planning_service.dart';
import 'package:provider/provider.dart';

class PlanningList extends StatefulWidget {
  @override
  _PlanningListState createState() => _PlanningListState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _PlanningListState extends State<PlanningList> {
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
          'Manage Planning/Events',
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
                child: SimpleDialog(
                  title: Text('Instruction'),
                  titlePadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                  children: <Widget>[
                    Text(
                      "Review the information below and put it into yourcalendar application. You may use the recommended timelines or change them to fit your life. Set the alarm function for each event to remind you of the upcoming event two weeks before it’s due for completion. For bigger events requiring longer planning, set the alarm function a couple of months before (example: planning a vacation or planning a dinner party). Once you have everything set in your calendar,in order to make sure your planning works, you must review the calendar often. Every week, take time to review the next two or three months to ensure you start thinking through planning considerations and coordination. Consider using the AR-TEC-ARC-D model to think through all actions, activities, and events. Memorize the model to have a quick mental checklist you can use that will force you to plan from multiple angles. Remember, you can also use this model for individual actions such as driving to work or simply just thinking through your day.",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/planning/add'),
        backgroundColor: Color(0xFFFE0000),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Consumer<PlanningProvider>(
            builder: (context, value, child) {
              List<Planning> plannings = value.plannings;

              return ListView.builder(
                itemCount: plannings.length,
                itemBuilder: (context, index) {
                  Planning planning = plannings[index];

                  return Dismissible(
                    key: Key(planning.id),
                    background: Container(color: Colors.red),
                    onDismissed: (DismissDirection direction) async {
                      await planningService.deletePlanning(planning.id).then((deleted) {
                        if (deleted) {
                          helpers.alert(scaffoldKey, "Planning deleted successfully.");
                        } else {
                          helpers.alert(scaffoldKey, "An error occurred, unable to delete planning.");
                        }

                        value.getPlannings();
                      });
                    },
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/planning/edit', arguments: planning),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              planning.activity ?? 'Clothing',
                              style: TextStyle(
                                fontFamily: 'Montserrat Semibold',
                                fontSize: 13.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.category,
                                  size: 14.0,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  "${planning.categories.length ?? 0} Categories",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat Medium',
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
