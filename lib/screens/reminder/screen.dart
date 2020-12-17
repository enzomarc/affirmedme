import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kronosme/core/models/reminder.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/reminder_provider.dart';
import 'package:kronosme/services/reminder_service.dart';
import 'package:provider/provider.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ReminderScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final reminderProvider =
        Provider.of<ReminderProvider>(context, listen: false);
    reminderProvider.getReminders();

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
                  'Reminder',
                  style: TextStyle(
                    fontFamily: 'Montserrat Bold',
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  width: 150.0,
                  child: RaisedButton(
                    onPressed: () {
                      DateTime scheduledAt = DateTime.now();
                      TextEditingController titleController =
                          TextEditingController();
                      TextEditingController groupController =
                          TextEditingController();

                      showDialog(
                        context: context,
                        child: SimpleDialog(
                          title: Text('Add Reminder'),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          children: <Widget>[
                            TextFormField(
                              controller: titleController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Title',
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
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
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: groupController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Group',
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
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
                            SizedBox(height: 10.0),
                            RaisedButton(
                              onPressed: () {
                                DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  currentTime: scheduledAt ??
                                      DateTime.now().add(Duration(days: 1)),
                                  onChanged: (time) {
                                    scheduledAt = time;
                                  },
                                );
                              },
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    color: Color(0xFFFE0000),
                                    size: 20.0,
                                  ),
                                  Text(
                                    'Choose date and time',
                                    style: TextStyle(
                                      color: Color(0xFFFE0000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            RaisedButton(
                              onPressed: () async {
                                if (titleController.text.isNotEmpty) {
                                  Map<String, dynamic> data = {
                                    'content': titleController.text,
                                    'group':
                                        groupController.text.toLowerCase() ??
                                            'all',
                                    'at': scheduledAt.toString(),
                                  };

                                  await reminderService
                                      .storeReminder(data)
                                      .then((saved) {
                                    if (saved) {
                                      Navigator.of(context).pop();
                                      helpers.alert(scaffoldKey,
                                          "Task added successfully.");
                                      reminderProvider.getReminders();
                                    } else {
                                      helpers.alert(scaffoldKey,
                                          "Unable to save this reminder.");
                                    }
                                  });
                                } else
                                  helpers.alert(
                                      scaffoldKey, "Title is missing.");
                              },
                              color: Color(0xFFFE0000),
                              child: Text(
                                'Save',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.add_alert,
                          color: Color(0xFFFE0000),
                          size: 20.0,
                        ),
                        Text(
                          'Add reminder',
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
            child: Consumer<ReminderProvider>(
              builder: (context, provider, child) {
                return GroupedListView(
                  elements: provider.reminders,
                  groupBy: (Reminder reminder) => reminder.group,
                  groupSeparatorBuilder: (value) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1.0,
                            blurRadius: 5.0,
                            offset: Offset(0, 1.0),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Text(
                        "${value.toUpperCase()} (${provider.reminders.where((element) => element.group == value).length})",
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                        ),
                      ),
                    );
                  },
                  itemBuilder: (context, Reminder reminder) {
                    return Dismissible(
                      key: Key(reminder.id.toString()),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          await reminderService
                              .deleteReminder(reminder.id)
                              .then((deleted) {
                            if (deleted) {
                              helpers.alert(
                                  scaffoldKey, "Task deleted successfully.");
                              reminderProvider.getReminders();
                            }
                          });
                        } else if (direction == DismissDirection.endToStart) {
                          await reminderService.updateReminder(
                              reminder.id, {'done': true}).then((updated) {
                            if (updated) {
                              helpers.alert(
                                  scaffoldKey, "Task marked as done.");
                              reminderProvider.getReminders();
                            }
                          });
                        }
                      },
                      background: Container(
                        color: Colors.red.shade400,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Do it later',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat Bold',
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.green.shade400,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Done',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat Bold',
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border(
                              bottom: BorderSide(color: Colors.white),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  reminder.content,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat Bold',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.red.shade300,
                                      size: 18.0,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red.shade300,
                                      size: 18.0,
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
          )
        ],
      ),
    );
  }
}
