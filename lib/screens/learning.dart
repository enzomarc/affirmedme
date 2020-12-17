import 'package:flutter/material.dart';
import 'package:kronosme/core/models/module.dart';
import 'package:kronosme/core/models/step.dart' as Model;
import 'package:kronosme/services/module_service.dart';

class LearningScreen extends StatefulWidget {
  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  List<Model.Step> items = [];

  @override
  Widget build(BuildContext context) {
    moduleService.getModules();

    String moduleTitle =
        (ModalRoute.of(context).settings.arguments as String).toLowerCase();
    Module module = moduleService.modules
        .firstWhere((element) => element.title.toLowerCase() == moduleTitle);
    items = module.steps;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              print(item.goals);

              return ParentItem(title: item.title, goals: item.goals);
            },
          ),
        ),
      ),
    );
  }
}

class ParentItem extends StatelessWidget {
  const ParentItem({
    this.title,
    this.goals,
    Key key,
  }) : super(key: key);

  final String title;
  final List<dynamic> goals;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'Discover learning.',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Montserrat Bold',
            ),
          ),
          SizedBox(height: 10.0),
          goals.length > 0
              ? Column(
                  children: goals
                      .map(
                        (e) => SubItem(
                          title: e.title,
                          children: e.tips,
                        ),
                      )
                      .toList(),
                )
              : Container(),
        ],
      ),
    );
  }
}

class SubItem extends StatelessWidget {
  const SubItem({
    this.title,
    this.children,
    Key key,
  }) : super(key: key);

  final String title;
  final List<dynamic> children;

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
                child: Text(
                  title ?? 'Be a hypperrealist.',
                  style: TextStyle(
                    fontFamily: 'Montserrat SemiBold',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: children
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
