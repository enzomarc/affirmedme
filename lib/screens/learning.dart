import 'package:flutter/material.dart';

class LearningScreen extends StatefulWidget {
  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  List<Map<String, dynamic>> items = [
    {
      'title': "Systemize your decision",
      'subitems': [],
    },
    {
      'title': "Embrace Reality and Deal with it",
      'subitems': [
        {
          'title': 'Be a hypperrealist',
          'children': [
            'Dreams + Reality + Determination = A Successful Life.',
          ],
        },
        {
          'title':
              'Truth-or, more precisely on accurate understanding cf reality-is the essential foundation for any good outcome.',
          'children': [],
        },
        {
          'title': 'Be radically open-minded and radically transparent',
          'children': [
            'Radical open-mindedness and radical transparency are invaluable for rapid learning and effective change.',
            "Don't let fears of what others think of you stand in your way.",
            'Radical open-mindedness and radical transparency are invaluable for rapid learning and effective change.',
          ],
        },
      ],
    },
    {
      'title': "Look to nature to learn how reality works",
      'subitems': [
        {
          'title': 'Be a hypperrealist',
          'children': [
            'Dreams + Reality + Determination = A Successful Life.',
          ],
        },
        {
          'title':
              'Truth-or, more precisely on accurate understanding cf reality-is the essential foundation for any good outcome.',
          'children': [],
        },
        {
          'title':
              'Truth-or, more precisely on accurate understanding cf reality-is the essential foundation for any good outcome.',
          'children': [],
        },
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xFFFE0000),
            ),
            onPressed: () {
              setState(() {
                print('The menu btn');
              });
            },
          ),
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          print(' The account Btn');
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 30.0,
                            color: Color(0xFFFE0000),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(
                                  'Hi John Doe',
                                  style: TextStyle(
                                    fontFamily: 'MontRegular',
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Premium package',
                                  style: TextStyle(
                                    fontFamily: 'MontBold',
                                    fontSize: 10.0,
                                    color: Color(0xFF59B306),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            size: 30.0,
                            color: Color(0xFF7C7373),
                          ),
                          onPressed: () {
                            print('Notification');
                          },
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Icon(
                            Icons.brightness_1,
                            color: Color(0xFFFE0000),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];

                return ParentItem(
                    title: item['title'], subitems: item['subitems']);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ParentItem extends StatelessWidget {
  const ParentItem({
    this.title,
    this.subitems,
    Key key,
  }) : super(key: key);

  final String title;
  final List<dynamic> subitems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Discover learning.',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'MontBold',
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              children: subitems
                  .map((e) => SubItem(
                        title: e['title'],
                        children: e['children'],
                      ))
                  .toList(),
            ),
          ],
        ),
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
                    fontFamily: 'MontSemi',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: children.map((e) => ItemChildren(content: e)).toList(),
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
