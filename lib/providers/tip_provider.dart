import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/tip.dart';
import 'package:kronosme/services/tip_service.dart';

class TipProvider extends ChangeNotifier {
  List<Tip> tips = [];

  getTips() {
    tipService.getTips().then((value) {
      tips = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
