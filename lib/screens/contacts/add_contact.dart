import 'package:flutter/material.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/contact_provider.dart';
import 'package:kronosme/services/contact_service.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
String selectedType = 'Account Type';
List<String> types = ['Account Type', 'Contact', 'Company'];

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController mail = TextEditingController();
    TextEditingController phone = TextEditingController();
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xFFFE0000),
                                size: 20.0,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              'Add new contact',
                              style: TextStyle(
                                fontFamily: 'Montserrat Bold',
                              ),
                            ),
                          ],
                        ),
                        FlatButton(
                          onPressed: () async {
                            if (mail.text.isNotEmpty &&
                                firstName.text.isNotEmpty &&
                                selectedType != 'Account Type') {
                              Map<String, dynamic> data = {
                                'first_name': firstName.text,
                                'last_name': lastName.text,
                                'email': mail.text,
                                'phone': phone.text,
                                'type': selectedType.toLowerCase(),
                              };
                              await contactService
                                  .storeContact(data)
                                  .then((saved) {
                                if (saved) {
                                  firstName.text = "";
                                  lastName.text = "";
                                  mail.text = "";

                                  contactProvider.getContacts();
                                  helpers.alert(scaffoldKey,
                                      "Contact added successfully.");
                                } else {
                                  helpers.alert(
                                      scaffoldKey, "Unable to add contact.");
                                }
                              });
                            } else {
                              helpers.alert(scaffoldKey,
                                  "First name, email and account type are required.");
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontFamily: 'Montserrat SemiBold',
                              color: Color(0xFFFE0000),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Start by entering an email address, name or both',
                      style: TextStyle(
                        fontFamily: 'Montserrat SemiBold',
                        fontSize: 11.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    InputField(
                      controller: firstName,
                      label: 'First Name/Company Name',
                    ),
                    InputField(
                      controller: lastName,
                      label: 'Last Name',
                    ),
                    InputField(
                      controller: mail,
                      label: 'Email',
                      type: TextInputType.emailAddress,
                    ),
                    InputField(
                      controller: phone,
                      label: 'Phone',
                      type: TextInputType.phone,
                    ),
                    DropdownButton(
                      underline: Container(),
                      isExpanded: true,
                      style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          fontSize: 10.0,
                          color: Colors.black),
                      value: selectedType,
                      items: types
                          .map(
                            (String item) => DropdownMenuItem(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Montserrat Medium',
                                ),
                              ),
                              value: item,
                            ),
                          )
                          .toList(),
                      onChanged: (String item) {
                        setState(() {
                          selectedType = item;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contactList');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Text('Import contact'),
                        color: Color(0xFFFFFFFF),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Text('Scan a business card'),
                        color: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    @required this.controller,
    this.label,
    this.type,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: TextField(
        keyboardType: type ?? TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          labelText: label ?? 'Username, Email or Phone',
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.grey.withOpacity(0.8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
    );
  }
}
