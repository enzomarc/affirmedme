import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kronosme/core/models/date.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/date_provider.dart';
import 'package:kronosme/services/date_service.dart';
import 'package:provider/provider.dart';

class DateModule extends StatefulWidget {
  @override
  _DateModuleState createState() => _DateModuleState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
List<String> groups = [
  'Friend Birthdays',
  'Immediate Family Birthdays',
  'Extended Family Birthdays',
  'Co-Worker Birthdays',
  'Organizational Birthdays',
  'Anniversaries',
  'Other Key Dates',
];
List<bool> expanded = [false, false, false, false, false, false, false];

class _DateModuleState extends State<DateModule> {
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
          'Remember The Important Dates',
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
                Consumer<DateProvider>(
                  builder: (context, provider, child) {
                    List<Date> dates = provider.dates;

                    return Expanded(
                      child: ListView.builder(
                        itemCount: groups.length,
                        itemBuilder: (context, index) {
                          String group = groups[index];
                          List<Date> groupDates = dates.where((date) => date.group.toLowerCase() == group.toLowerCase()).toList();

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
                                          group.toUpperCase(),
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
                                          itemCount: groupDates.length,
                                          itemBuilder: (context, index) {
                                            Date tmpDate = groupDates[index];

                                            return Container(
                                              margin: EdgeInsets.only(bottom: 10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    tmpDate.name ?? 'Marc Enzo',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat SemiBold',
                                                      fontSize: 14.0,
                                                    ),
                                                  ), // date name
                                                  SizedBox(height: 5.0),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 5.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          "Important Date: ${tmpDate.getDate()}",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat Medium',
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5.0),
                                                        Text(
                                                          "Remind On: ${tmpDate.getRemindAt()}",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat Medium',
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                      ],
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
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                String tmp = group.substring(0, group.length - 1);
                                                String title = "Add $tmp";
                                                TextEditingController name = TextEditingController();
                                                DateTime date;
                                                DateTime remind;

                                                return SimpleDialog(
                                                  title: Text(
                                                    title,
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat SemiBold',
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller: name,
                                                      keyboardType: TextInputType.text,
                                                      style: TextStyle(fontSize: 13.0),
                                                      decoration: InputDecoration(
                                                        labelText: 'Name',
                                                        labelStyle: TextStyle(
                                                          color: Colors.grey.withOpacity(0.8),
                                                          fontSize: 12.0,
                                                        ),
                                                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                                        border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            width: 1.0,
                                                            color: Colors.grey.withOpacity(0.4),
                                                          ),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            width: 1.0,
                                                            color: Colors.grey.withOpacity(0.4),
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
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: RaisedButton(
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          DatePicker.showDatePicker(
                                                            context,
                                                            showTitleActions: true,
                                                            currentTime: date ?? DateTime.now(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                date = value;
                                                              });
                                                            },
                                                          );
                                                        },
                                                        child: Text(
                                                          'Select Date',
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat SemiBold',
                                                            fontSize: 11.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: RaisedButton(
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          DatePicker.showDateTimePicker(
                                                            context,
                                                            showTitleActions: true,
                                                            currentTime: remind ?? DateTime.now(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                remind = value;
                                                              });
                                                            },
                                                          );
                                                        },
                                                        child: Text(
                                                          'Remind On',
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat SemiBold',
                                                            fontSize: 11.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: RaisedButton(
                                                        color: Colors.black,
                                                        onPressed: () async {
                                                          Map<String, dynamic> data = {
                                                            'name': name.text,
                                                            'group': group,
                                                            'date': date.toString(),
                                                            'remind_at': remind.toString(),
                                                          };

                                                          if (name.text.isNotEmpty && date != null && remind != null) {
                                                            await dateService.storeDate(data).then((stored) {
                                                              Navigator.pop(context);

                                                              if (stored) {
                                                                helpers.alert(scaffoldKey, "Important date added successfully.");
                                                                provider.getDates();
                                                              } else {
                                                                helpers.alert(scaffoldKey, "An error occurred, unable to add important date.");
                                                              }
                                                            });
                                                          } else {
                                                            helpers.alert(scaffoldKey, "All fields are required.");
                                                          }
                                                        },
                                                        child: Text(
                                                          'Save Important Date',
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat SemiBold',
                                                            fontSize: 11.0,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
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
                                                'Add Date',
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
