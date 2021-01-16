import 'package:flutter/cupertino.dart';
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
            "${contact.name}" ?? "Contact Information",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat Bold',
              fontSize: 13.0,
            ),
          ),
          titleSpacing: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.black,
                size: 20.0,
              ),
              onPressed: () {
                helpers.alert(scaffoldKey, "You can't edit this contact.");
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 20.0,
              ),
              onPressed: () async {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Delete Contact'),
                      content: Text('Are you sure you want to delete this contact?'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('Cancel'),
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('Yes, Delete'),
                          isDefaultAction: true,
                          onPressed: () async {
                            await contactService.deleteContact(contact.id).then((deleted) {
                              Navigator.pop(context);

                              if (deleted) {
                                contactProvider.getContacts();
                                Navigator.pop(context);
                              } else {
                                helpers.alert(scaffoldKey, "An error occured, unable to delete this contact.");
                              }
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Field(label: 'Name', value: contact.name),
                Field(label: 'Email', value: contact.email),
                Field(label: 'Phone', value: contact.phone),
                Field(label: 'Location', value: contact.location),
                Field(label: 'Industry', value: contact.industry),
                Field(label: 'Hobby', value: contact.hobby),
                Field(label: 'Birthday', value: contact.birthday.toString()),
                Field(label: 'Last Contact Date', value: contact.lastContact.toString()),
                Field(label: 'Next Contact Date', value: contact.nextContact.toString()),
                Field(label: 'Remind Me On', value: contact.remindAt.toString()),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        helpers.sendSMS(contact.phone);
                      },
                      color: Colors.black,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.sms,
                            color: Colors.white,
                            size: 16.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Send SMS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        helpers.sendMail(contact.email);
                      },
                      color: Colors.black,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 16.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Send Mail',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        helpers.makeCall(contact.phone);
                      },
                      color: Colors.green.shade400,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 16.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Call',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  const Field({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat Medium',
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          Text(
            value != null && value.isNotEmpty ? value : 'N/A',
            style: TextStyle(
              fontFamily: 'Montserrat SemiBold',
              fontSize: 12.0,
            ),
          ),
        ],
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
