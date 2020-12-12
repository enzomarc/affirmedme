import 'package:dio/dio.dart';
import 'package:kronosme/core/models/module.dart';
import 'package:kronosme/core/networker.dart';

class ModuleService {
  Future<List<Module>> getModules() async {
    List<Module> modules = [];

    try {
      Response response = await worker.get("/modules/basic");

      if (response.statusCode != 200)
        return modules;
      else {
        List data = response.data as List;
        modules = List<Module>.from(data.map((json) => Module.fromJson(json)));

        return modules;
      }
    } on DioError catch (e) {
      print(e);
      return modules;
    }
  }
}

ModuleService moduleService = ModuleService();
