import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/date.dart';
import 'package:kronosme/services/date_service.dart';

class DateProvider extends ChangeNotifier {
  List<Date> dates = [];

  getDates() {
    dateService.getDates().then((value) {
      dates = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
