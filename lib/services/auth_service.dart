import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> _auth(String token, User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.clear();
    sharedPreferences.setString('token', token);
    sharedPreferences.setString('user', jsonEncode(user.toJson()));
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    worker.navigatorKey.currentState.pushNamed('/login');
  }

  /// Check if user is connected by retrieving token then
  /// send request to backend to check if logged in token is correct.
  Future<bool> check() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    Response response = await worker.get("/check/$token");

    if (response.statusCode != 200) {
      print(response.data);
      return false;
    } else {
      return true;
    }
  }

  /// Login user using given `email` and `password`
  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await worker.post("/auth");

      if (response.statusCode != 200) {
        print(response.data);
        return false;
      } else {
        var data = jsonDecode(response.data);
        String token = data.token;
        User user = User.fromJson(data.user);
        await _auth(token, user);

        worker.navigatorKey.currentState.pushNamed("/dashboard");
      }
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  /// Register basic user with given `data`.
  Future<dynamic> register(Map<String, dynamic> data) async {
    try {
      Response response =
          await worker.post("/register", params: jsonEncode(data));

      if (response.statusCode != 201) {
        print(response.data);
        return false;
      } else {
        String token = response.data['token'];
        User user = User.fromJson(response.data['user']);
        await _auth(token, user);

        worker.navigatorKey.currentState.pushNamed("/welcome");
      }
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

final AuthService auth = AuthService();
