import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/contact.dart';
import 'package:kronosme/services/contact_service.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts = [];

  getContacts() {
    contactService.getContacts().then((value) {
      contacts = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
