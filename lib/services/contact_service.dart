import 'package:dio/dio.dart';
import 'package:kronosme/core/models/contact.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/services/auth_service.dart';

class ContactService {
  List<Contact> contacts = [];

  Future<List<Contact>> getContacts() async {
    try {
      User user = await auth.user();
      Response response = await worker.get("/contacts/${user.id}");

      if (response.statusCode != 200)
        return contacts;
      else {
        List data = response.data as List;
        contacts =
            List<Contact>.from(data.map((json) => Contact.fromJson(json)));

        return contacts;
      }
    } on DioError catch (e) {
      print(e);
      return contacts;
    }
  }

  Future<bool> storeContact(Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response =
          await worker.post("/contacts/${user.id}", params: data);

      return response.statusCode == 201;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateContact(String id, Map<String, dynamic> data) async {
    try {
      User user = await auth.user();
      Response response =
          await worker.put("/contacts/${user.id}/$id", params: data);

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteContact(String id) async {
    try {
      User user = await auth.user();
      Response response = await worker.delete("/contacts/${user.id}/$id");

      return response.statusCode == 200;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

ContactService contactService = ContactService();
