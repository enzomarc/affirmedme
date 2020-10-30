import 'package:flutter/material.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController mail = TextEditingController();

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
          padding:
              EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
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
                              fontFamily: 'MontBold',
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: 'MontSemi',
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
                      fontFamily: 'MontSemi',
                      fontSize: 11.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(controller: firstName, label: 'First Name'),
                  InputField(controller: lastName, label: 'Last Name'),
                  InputField(controller: mail, label: 'Email'),
                ],
              ),
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
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    @required this.controller,
    this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label ?? 'Username, Email or Phone',
          labelStyle: TextStyle(
            fontFamily: 'MontRegular',
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
