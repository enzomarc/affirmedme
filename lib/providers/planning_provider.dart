import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/planning.dart';
import 'package:kronosme/services/planning_service.dart';

class PlanningProvider extends ChangeNotifier {
  List<Planning> plannings = [];

  getPlannings() {
    planningService.getPlannings().then((value) {
      plannings = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
