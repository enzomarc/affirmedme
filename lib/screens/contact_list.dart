import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kronosme/core/models/contact.dart';
import 'package:kronosme/providers/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  String selectedItem = 'Sorted by';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> filter = ['Sorted by', 'Name', 'Address', 'Mail'];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/contacts/add');
        },
        backgroundColor: Color(0xFFFE0000),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    underline: Container(),
                    style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 10.0,
                        color: Colors.black),
                    value: selectedItem,
                    items: filter
                        .map(
                          (String item) => DropdownMenuItem(
                            child: Text(item),
                            value: item,
                          ),
                        )
                        .toList(),
                    onChanged: (String item) {
                      setState(() {
                        selectedItem = item;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                    width: MediaQuery.of(context).size.width - 200.0,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: 'Enter your search here',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 11.0,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 16.0,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            print('Search clicked');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<ContactProvider>(
                builder: (context, value, child) {
                  List<Contact> contacts = value.contacts
                      .where((contact) => contact.type == 'contact')
                      .toList();

                  return GroupedListView(
                    elements: contacts,
                    groupBy: (Contact contact) => contact.firstName[0],
                    itemBuilder: (context, Contact contact) => Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      margin:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Text(
                        "${contact.firstName} ${contact.lastName}",
                        style: TextStyle(
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    groupSeparatorBuilder: (value) => Container(
                      margin: EdgeInsets.only(top: 10.0, left: 2.0, right: 2.0),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
