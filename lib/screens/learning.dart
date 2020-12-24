import 'package:flutter/material.dart';
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

    String title = (ModalRoute.of(context).settings.arguments as String);
    String moduleTitle =
        (ModalRoute.of(context).settings.arguments as String).toLowerCase();
    Module module = moduleService.modules
        .firstWhere((element) => element.title.toLowerCase() == moduleTitle);
    items = module.steps;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          padding: const EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 10.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xFFFE0000),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 1.0),
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          fontSize: 16.0,
                          color: Color(0xFFFE0000),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.0),
                    IconButton(
                      icon: Icon(Icons.info, color: Colors.blueAccent.shade200),
                      onPressed: () {
                        showDialog(
                          context: context,
                          child: SimpleDialog(
                            contentPadding: EdgeInsets.all(20.0),
                            title: Text(
                              'Instruction',
                              style: TextStyle(
                                fontFamily: 'Montserrat Semibold',
                                fontSize: 16.0,
                              ),
                            ),
                            children: <Widget>[
                              Text(module.instruction),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
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
      margin: EdgeInsets.symmetric(vertical: 10.0),
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
                      fontSize: 16.0,
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
      margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
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
              SizedBox(width: 10.0),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      child: SimpleDialog(
                        title: Text('Reminder'),
                        contentPadding: EdgeInsets.all(20.0),
                        children: <Widget>[
                          Text(
                            'Add this item to reminder?',
                            style: TextStyle(
                              fontFamily: 'Montserrat Medium',
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                ),
                              ),
                              Expanded(
                                child: RaisedButton(
                                  onPressed: () async {
                                    Map<String, dynamic> data = {
                                      'content': widget.goal.title,
                                      'group': widget.moduleTitle,
                                      'at': DateTime.now()
                                          .add(Duration(days: 1))
                                          .toString(),
                                    };

                                    await reminderService
                                        .storeReminder(data)
                                        .then(
                                      (value) {
                                        if (value) {
                                          helpers.alert(scaffoldKey,
                                              "Item added to the reminder successfully.");
                                        } else {
                                          helpers.alert(scaffoldKey,
                                              "Unable to add this item to reminder.");
                                        }

                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  child: Text('Add to reminder'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.greenAccent.shade700,
                        value: widget.goal.checked ?? false,
                        onChanged: (value) async {
                          await moduleService
                              .check(widget.goal.title)
                              .then((updated) {
                            if (updated) {
                              setState(() {
                                widget.goal.checked = value;
                              });
                            }
                          }).catchError((err) {
                            print(err);
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          widget.goal.title ?? 'Be a hypperrealist.',
                          style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: widget.goal.tips
                .map((e) => e != null ? ItemChildren(content: e) : Container())
                .toList(),
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
