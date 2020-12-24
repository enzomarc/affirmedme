import 'package:flutter/material.dart';
import 'package:kronosme/core/models/contact.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/contact_provider.dart';
import 'package:kronosme/services/contact_service.dart';
import 'package:provider/provider.dart';

class ContactInformationPage extends StatefulWidget {
  @override
  _ContactInformationPageState createState() => _ContactInformationPageState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _ContactInformationPageState extends State<ContactInformationPage> {
  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context).settings.arguments;
    final contactProvider = Provider.of<ContactProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
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
                          "${contact.firstName} ${contact.lastName}" ??
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
                          onpressed: () {
                            helpers.makeCall(contact.phone);
                          },
                        ),
                        ActionBtn(
                          title: 'Email',
                          icon: Icons.mail,
                          onpressed: () {
                            helpers.sendMail(contact.email);
                          },
                        ),
                        ActionBtn(
                          title: 'Message',
                          icon: Icons.message,
                          onpressed: () {
                            helpers.sendSMS(contact.phone);
                          },
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
                          TextEditingController noteController =
                              TextEditingController();

                          showDialog(
                            context: context,
                            child: SimpleDialog(
                              title: Text('New Note'),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20.0),
                              children: <Widget>[
                                TextFormField(
                                  controller: noteController,
                                  keyboardType: TextInputType.text,
                                  minLines: 2,
                                  maxLines: 20,
                                  decoration: InputDecoration(
                                    hintText: 'Note Content',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.8),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color:
                                            Color(0xFFFE0000).withOpacity(0.4),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color:
                                            Color(0xFFFE0000).withOpacity(0.4),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(0xFFFE0000),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                RaisedButton(
                                  onPressed: () async {
                                    if (noteController.text.isNotEmpty) {
                                      String data = noteController.text;

                                      await contactService
                                          .storeNote(contact, data)
                                          .then((saved) {
                                        if (saved) {
                                          Navigator.of(context).pop();
                                          helpers.alert(scaffoldKey,
                                              "Note added successfully.");
                                          contactProvider.getContacts();
                                        } else {
                                          helpers.alert(scaffoldKey,
                                              "Unable to save this note.");
                                        }
                                      });
                                    } else
                                      helpers.alert(
                                          scaffoldKey, "Note content is missing.");
                                  },
                                  color: Color(0xFFFE0000),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      ActionBtn(
                        title: 'Delete',
                        icon: Icons.close,
                        onpressed: () async {
                          await contactService
                              .deleteContact(contact.id)
                              .then((deleted) {
                            if (deleted) {
                              Navigator.pop(context);
                            } else {
                              helpers.alert(
                                  scaffoldKey, "Unable to delete contact.");
                            }
                          }).catchError((err) {
                            print(err);
                            helpers.alert(
                                scaffoldKey, "Unable to delete contact.");
                          });
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
                    'Notes',
                    style: TextStyle(
                      fontFamily: 'Montserrat Semibold',
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: ListView.builder(
                    itemCount: contact.notes.length,
                    itemBuilder: (context, index) => NoteTask(
                      index: index,
                      contact: contact,
                      content: contact.notes[index] ?? 'Note',
                    ),
                  ),
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
    @required this.content,
    @required this.index,
    @required this.contact,
  }) : super(key: key);

  final String content;
  final int index;
  final Contact contact;

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
            'Note',
            style: TextStyle(
              fontFamily: 'Montserrat Bold',
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            content ?? 'Contact and save our rendez-vous',
            style: TextStyle(
              fontFamily: 'Montserrat Medium',
              fontSize: 13.0,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: FlatButton(
              onPressed: () async {
                await contactService.deleteNote(contact, index.toString());
              },
              child: Text(
                'delete',
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
