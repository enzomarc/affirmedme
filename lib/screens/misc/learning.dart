import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kronosme/core/models/goal.dart';
import 'package:kronosme/core/models/module.dart';
import 'package:kronosme/core/models/step.dart' as Model;
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/services/module_service.dart';
import 'package:kronosme/services/reminder_service.dart';

class LearningScreen extends StatefulWidget {
  @override
  _LearningScreenState createState() => _LearningScreenState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _LearningScreenState extends State<LearningScreen> {
  List<Model.Step> items = [];

  @override
  Widget build(BuildContext context) {
    moduleService.getModules();

    Map<String, dynamic> params = ModalRoute.of(context).settings.arguments;
    String title = params['module'];
    String moduleTitle = params['module'].toString().toLowerCase();
    Module module = moduleService.modules.firstWhere((element) => element.title.toLowerCase() == moduleTitle);
    items = module.steps;
    Widget buttons = params['buttons'];

    return SafeArea(
      child: Scaffold(
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
            title,
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
                        "${module.instruction}",
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
        body: Container(
          padding: const EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index];

                    return ParentItem(
                      moduleTitle: moduleTitle,
                      title: item.title,
                      goals: item.goals,
                    );
                  },
                ),
              ),
              if (buttons != null)
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: buttons,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParentItem extends StatefulWidget {
  const ParentItem({
    this.moduleTitle,
    this.title,
    this.goals,
    Key key,
  }) : super(key: key);

  final String moduleTitle;
  final String title;
  final List<dynamic> goals;

  @override
  _ParentItemState createState() => _ParentItemState();
}

class _ParentItemState extends State<ParentItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Row(
              children: <Widget>[
                Icon(
                  expanded ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Text(
                    widget.title ?? 'Discover learning.',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Montserrat Bold',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          if (widget.goals.length > 0)
            if (expanded)
              Column(
                children: widget.goals
                    .map(
                      (e) => SubItem(
                        moduleTitle: widget.moduleTitle,
                        goal: e,
                      ),
                    )
                    .toList(),
              )
            else
              Container()
          else
            Container(),
        ],
      ),
    );
  }
}

class SubItem extends StatefulWidget {
  const SubItem({
    this.moduleTitle,
    @required this.goal,
    Key key,
  }) : super(key: key);

  final Goal goal;
  final String moduleTitle;

  @override
  _SubItemState createState() => _SubItemState();
}

class _SubItemState extends State<SubItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFE0000),
                  borderRadius: BorderRadius.circular(500.0),
                ),
                height: 7.0,
                width: 7.0,
              ),
              SizedBox(width: 5.0),
              Expanded(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.alarm_add,
                        size: 16.0,
                        color: Color(0xFFFE0000),
                      ),
                      onPressed: () async {
                        DateTime scheduledAt = DateTime.now();
                        TextEditingController titleController = TextEditingController(text: widget.goal.title);
                        TextEditingController groupController = TextEditingController(text: widget.moduleTitle);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) => SimpleDialog(
                            title: Text('Add Reminder'),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                            children: <Widget>[
                              TextFormField(
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Title',
                                  hintStyle: TextStyle(
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
                              SizedBox(height: 10.0),
                              TextFormField(
                                controller: groupController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Group',
                                  hintStyle: TextStyle(
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
                              SizedBox(height: 10.0),
                              RaisedButton(
                                onPressed: () {
                                  DatePicker.showDateTimePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    currentTime: scheduledAt ?? DateTime.now().add(Duration(days: 1)),
                                    onChanged: (time) {
                                      scheduledAt = time;
                                    },
                                  );
                                },
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      'group': groupController.text.toLowerCase() ?? 'all',
                                      'at': scheduledAt.toString(),
                                    };

                                    await reminderService.storeReminder(data).then((saved) {
                                      if (saved) {
                                        Navigator.of(context).pop();
                                        helpers.alert(scaffoldKey, "Task added successfully.");
                                      } else {
                                        helpers.alert(scaffoldKey, "Unable to save this reminder.");
                                      }
                                    });
                                  } else
                                    helpers.alert(scaffoldKey, "Title is missing.");
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
                    ),
                    Expanded(
                      child: Text(
                        widget.goal.title ?? 'Be a hypperrealist.',
                        style: TextStyle(
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 1.0),
          Column(
            children: widget.goal.tips.map((e) => e != null ? ItemChildren(content: e) : Container()).toList(),
          ),
        ],
      ),
    );
  }
}

class ItemChildren extends StatelessWidget {
  const ItemChildren({
    this.content,
    Key key,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 2.0,
          ),
        ),
      ),
      padding: EdgeInsets.only(left: 10.0),
      margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
      child: Text(
        content ?? 'Dreams + Reality + Determination = A Successful Life.',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
