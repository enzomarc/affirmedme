import 'package:flutter/material.dart';
import 'package:kronosme/screens/companies_list.dart';
import 'package:kronosme/screens/contact_list.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>
    with TickerProviderStateMixin {
  final PageStorageBucket bucket = PageStorageBucket();
  int selectedIndex = 0;
  List<Widget> tabs = [
    ContactsList(),
    CompaniesList(),
  ];

  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 2, vsync: this);

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
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                indicatorColor: Color(0xFFFE0000),
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 14.0,
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                tabs: [
                  Tab(text: 'Contacts'),
                  Tab(text: 'Companies'),
                ],
              ),
              Expanded(
                child: PageStorage(bucket: bucket, child: tabs[selectedIndex]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
