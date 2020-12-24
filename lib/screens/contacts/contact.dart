import 'package:flutter/material.dart';
import 'package:kronosme/providers/contact_provider.dart';
import 'package:kronosme/screens/contacts/companies_list.dart';
import 'package:kronosme/screens/contacts/contact_list.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactScreen>
    with TickerProviderStateMixin {
  final PageStorageBucket bucket = PageStorageBucket();
  int selectedIndex = 0;

  List<Widget> tabs = [
    ContactsList(),
    CompaniesList(),
  ];

  void loadInfo() async {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    contactProvider.getContacts();
  }

  @override
  void initState() {
    loadInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(
      initialIndex: selectedIndex,
      length: 2,
      vsync: this,
    );

    return SafeArea(
      child: Scaffold(
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
