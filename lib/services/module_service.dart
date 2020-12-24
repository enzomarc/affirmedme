import 'package:dio/dio.dart';
import 'package:kronosme/core/models/module.dart';
import 'package:kronosme/core/networker.dart';
import 'package:kronosme/services/auth_service.dart';

class ModuleService {
  List<Module> modules = [];

  Future<List<Module>> getModules() async {
    try {
      var user = await auth.user();

      if (user != false) {
        String url =
            user.premium ? "/modules/premium/${user.id}" : "/modules/basic";
        Response response = await worker.get(url);

        if (response.statusCode != 200)
          return modules;
        else {
          List data = response.data as List;
          this.modules =
              List<Module>.from(data.map((json) => Module.fromJson(json)));

          return modules;
        }
      } else {
        return modules;
      }
    } on DioError catch (e) {
      print(e);
      return modules;
    }
  }

  Future<bool> check(String title) async {
    try {
      var user = await auth.user();

      if (user != false) {
        Response response = await worker.post("/modules/${user.id}/check",
            params: {'title': title.toLowerCase()});

        return response.statusCode == 200;
      } else
        return false;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

ModuleService moduleService = ModuleService();
