import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/module.dart';
import 'package:kronosme/services/module_service.dart';

class ModuleProvider extends ChangeNotifier {
  List<Module> modules = [];

  getModules() {
    moduleService.getModules().then((value) {
      modules = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
