import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/contact_provider.dart';
import 'package:kronosme/services/contact_service.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController name = TextEditingController();
TextEditingController location = TextEditingController();
TextEditingController industry = TextEditingController();
TextEditingController hobby = TextEditingController();
TextEditingController mail = TextEditingController();
TextEditingController phone = TextEditingController();
DateTime birthdate;
DateTime lastContact;
DateTime nextContact;
DateTime remindAt;
String selectedType = 'Account Type';
List<String> types = ['Account Type', 'Contact', 'Company'];

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context, listen: false);

    return Scaffold(
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
          'Add New Contact',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat Bold',
            fontSize: 13.0,
          ),
        ),
        titleSpacing: 0.0,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              child: Text(
                'Save',
                style: TextStyle(color: Color(0xFFFE0000), fontFamily: 'Montserrat Bold'),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InputField(
                      controller: name,
                      label: 'Name',
                    ),
                    InputField(
                      controller: location,
                      label: 'Location',
                    ),
                    InputField(
                      controller: industry,
                      label: 'Industry',
                    ),
                    InputField(
                      controller: hobby,
                      label: 'Hobby',
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
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            maxTime: DateTime.now().subtract(Duration(days: 365)),
                            currentTime: birthdate ?? DateTime.now().subtract(Duration(days: 365)),
                            onChanged: (time) {
                              setState(() {
                                birthdate = time;
                              });
                            },
                          );
                        },
                        child: Text(
                          'Birthdate',
                          style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            currentTime: lastContact ?? DateTime.now(),
                            onChanged: (time) {
                              setState(() {
                                lastContact = time;
                              });
                            },
                          );
                        },
                        child: Text(
                          'Last Contact Date',
                          style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now().add(Duration(minutes: 1)),
                            currentTime: nextContact ?? DateTime.now().add(Duration(minutes: 1)),
                            onChanged: (time) {
                              setState(() {
                                nextContact = time;
                              });
                            },
                          );
                        },
                        child: Text(
                          'Next Contact Date',
                          style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now().add(Duration(minutes: 1)),
                            currentTime: remindAt ?? DateTime.now().add(Duration(minutes: 1)),
                            onChanged: (time) {
                              setState(() {
                                remindAt = time;
                              });
                            },
                          );
                        },
                        child: Text(
                          'Remind Me On',
                          style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () async {
                          if (mail.text.isNotEmpty && name.text.isNotEmpty && location.text.isNotEmpty) {
                            Map<String, dynamic> data = {
                              'name': name.text,
                              'location': location.text,
                              'industry': industry.text,
                              'hobby': hobby.text,
                              'email': mail.text,
                              'phone': phone.text,
                              'birthday': birthdate.toString(),
                              'last_contact': lastContact.toString(),
                              'next_contact': nextContact.toString(),
                              'remind_at': remindAt.toString(),
                            };

                            await contactService.storeContact(data).then((saved) {
                              if (saved) {
                                name.text = "";
                                location.text = "";
                                industry.text = "";
                                mail.text = "";
                                phone.text = "";

                                contactProvider.getContacts();
                                helpers.alert(scaffoldKey, "Contact added successfully.");
                              } else {
                                helpers.alert(scaffoldKey, "Unable to add contact.");
                              }
                            });
                          } else {
                            helpers.alert(scaffoldKey, "Name, email and location are required.");
                          }
                        },
                        child: Text(
                          'Save Contact',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 12.0,
                          ),
                        ),
                        color: Colors.black,
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
      child: TextField(
        keyboardType: type ?? TextInputType.text,
        controller: controller,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13.0,
        ),
        decoration: InputDecoration(
          labelText: label ?? 'Username, Email or Phone',
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13.0,
            color: Colors.grey.withOpacity(0.8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
