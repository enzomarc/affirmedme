import 'package:flutter/material.dart';

class LearningScreen extends StatefulWidget {
  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  List<Map<String, dynamic>> items = [
    {
      "_id": {"oid": "5fcfc18073d0be17f473081c"},
      "title": "ACTIVITIES/EVENTS",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473081d"},
          "title":
              "Write upcoming meetings, appointments, events in sequential order for tomorrow"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473081e"},
          "title":
              "Write upcoming meetings, appointments, events in sequential order through the next two weeks"
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f473081f"},
      "title": "REQUIREMENTS/PLANNING",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730820"},
          "title": "Determine situational priming/conditioning requirements "
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730821"},
          "title": "Venue/Location considerations for all activities/events"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730822"},
          "title":
              "Address failures and mitigate risks and potential issues for all activities/events"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730823"},
          "title":
              "Address top 3 goals for the day – Think through start to finish in detail"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730824"},
          "title": "Documents/Binders"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730825"},
          "title": "Equipment"
        },
        {
          "tips": [null, null, null, null],
          "_id": {"oid": "5fcfc18073d0be17f4730826"},
          "title": "Everyday item check"
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f4730827"},
      "title": "ENVIRONMENT (NEWS, WEATHER, THREATS)",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730828"},
          "title":
              "Review local and national news; use multiple news sources for a broad understanding"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730829"},
          "title": "Review the weather"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473082a"},
          "title":
              "Review potential threats and crime maps for areas you plan to visit"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473082b"},
          "title":
              "Look up each venue you plan to visit to familiarize yourself with the environment"
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f473082c"},
      "title": "TRANSPORTATION (METHODS, ROUTES, TOLLS, PARKING):",
      "goals": [
        {
          "tips": [null],
          "_id": {"oid": "5fcfc18073d0be17f473082d"},
          "title": "Methods of transportation to arrive at each event"
        },
        {
          "tips": [null, null, null],
          "_id": {"oid": "5fcfc18073d0be17f473082e"},
          "title": "Route "
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f473082f"},
      "title": "CLOTHING (COLORS, ANCHORS, VENUES)",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730830"},
          "title":
              "Determine what attire/style of clothing you need for each activity and prepare accordingly"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730831"},
          "title":
              "Determine what colors to wear to engender feelings – example: trust (blue), attraction (red), approachable (yellow/pink), authority (black, navy blue)"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730832"},
          "title":
              "Determine if you should wear a conversational anchor to drive topics and discussions – example: lapel pins, cufflinks, watches"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730833"},
          "title":
              "Ensure your attire is appropriate for the venue; look up dress codes, if necessary"
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f4730834"},
      "title": "ACTIVITIES (DAILY TASKS)",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730835"},
          "title": "Daily Morning Routine Actions"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730836"},
          "title": "Leaving for the Day Actions"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730837"},
          "title": "Workday Actions"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730838"},
          "title": "Evening Routine Actions"
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f4730839"},
      "title": "REQUIREMENTS (DAILY)",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473083a"},
          "title": "See Above"
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f473083b"},
      "title": "COMMUNICATION (FAMILY, FRIENDS, COLLEAGUES, COORDINATION)",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473083c"},
          "title":
              "Confirm Appointments/Meetings – make reservations for the next two weeks"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473083d"},
          "title": "Coordination for Activities/Events – up, down, and lateral"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473083e"},
          "title": "Call/Text family and friends – Relationship Management"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f473083f"},
          "title": "Colleagues/Professional Associates – Network Management"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730840"},
          "title": "Follow up with new contacts "
        }
      ]
    },
    {
      "_id": {"oid": "5fcfc18073d0be17f4730841"},
      "title": "DECISIONS",
      "goals": [
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730842"},
          "title":
              "Think through the top 3 decisions you need to make today or throughout the week; determine what additional information you need to finalize decisions"
        },
        {
          "tips": [],
          "_id": {"oid": "5fcfc18073d0be17f4730843"},
          "title":
              "Think through upcoming decisions you need to make in the next two weeks  "
        }
      ]
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
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Premium package',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat Bold',
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

                return ParentItem(title: item['title'], goals: item['goals']);
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
    this.goals,
    Key key,
  }) : super(key: key);

  final String title;
  final List<dynamic> goals;

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
                fontFamily: 'Montserrat Bold',
              ),
            ),
            SizedBox(height: 10.0),
            goals.length > 0
                ? Column(
                    children: goals
                        .map(
                          (e) => SubItem(
                            title: e['title'],
                            children: e['tips'],
                          ),
                        )
                        .toList(),
                  )
                : Container(),
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
                    fontFamily: 'Montserrat SemiBold',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: children.map((e) => e != null ? ItemChildren(content: e) : Container()).toList(),
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
