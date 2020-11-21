import 'package:flutter/material.dart';

class ContactInformationPage extends StatefulWidget {
  @override
  _ContactInformationPageState createState() => _ContactInformationPageState();
}

class _ContactInformationPageState extends State<ContactInformationPage> {
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 5.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              children: [
                Column(
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
                          'Aladin Smith',
                          style: TextStyle(
                            fontFamily: 'Montserrat Bold',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActionBtn(
                          title: 'Call',
                        ),
                        ActionBtn(
                          title: 'Email',
                          icon: Icons.mail,
                        ),
                        ActionBtn(
                          title: 'Message',
                          icon: Icons.message,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                  ),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.0,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFE0000), width: 2.0),
                      ),
                    ),
                    child: Text(
                      'Activity',
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionBtn(
                        title: 'Add note',
                        icon: Icons.note_add,
                        onpressed: () {
                          Navigator.pushNamed(context, '/addContact');
                        },
                      ),
                      ActionBtn(
                        title: 'Add task',
                        icon: Icons.add_box,
                        onpressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'November 2020',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                    ),
                  ),
                ),
                NoteTask(
                  title: 'Note',
                ),
                NoteTask(
                  title: 'Task',
                ),
                NoteTask(
                  title: 'Note',
                ),
                NoteTask(
                  title: 'Task',
                ),
                NoteTask(
                  title: 'Note',
                ),
                NoteTask(
                  title: 'Task',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoteTask extends StatelessWidget {
  const NoteTask({
    Key key,
    this.title,
    this.date,
    this.information,
  }) : super(key: key);

  final String title;
  final String date;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'Note',
            style: TextStyle(
              fontFamily: 'Montserrat Bold',
            ),
          ),
          Text(
            date ?? 'Nov 22, 2020 at 14:47',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 11.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            information ?? 'Contact and save our rendez-vous',
            style: TextStyle(
              fontFamily: 'Montserrat SemiBold',
              fontSize: 13.0,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'view',
                style: TextStyle(
                  color: Color(0xFFFE0000),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  const ActionBtn({
    Key key,
    this.title,
    this.icon,
    this.onpressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onpressed,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              Positioned(
                top: 12.0,
                left: 12.0,
                child: Icon(
                  icon ?? Icons.call,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            title ?? 'Call',
            style: TextStyle(
              fontFamily: 'Montserrat Bold',
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
