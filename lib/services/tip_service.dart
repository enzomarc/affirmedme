import 'package:dio/dio.dart';
import 'package:kronosme/core/models/tip.dart';
import 'package:kronosme/core/networker.dart';

import 'auth_service.dart';

class TipService {
  List<Tip> tips = [];

  Future<List<Tip>> getTips() async {
    try {
      var user = await auth.user();

      if (user != false) {
        Response response = await worker.get("/daily_tip");

        if (response.statusCode != 200)
          return tips;
        else {
          List data = response.data as List;
          this.tips = List<Tip>.from(data.map((json) => Tip.fromJson(json)));
          print(this.tips);

          return tips;
        }
      } else {
        return tips;
      }
    } on DioError catch (e) {
      print(e);
      return tips;
    }
  }
}

TipService tipService = TipService();
