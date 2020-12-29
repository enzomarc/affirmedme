import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kronosme/core/models/user.dart';
import 'package:kronosme/core/networker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String username;
  String accountType;

  /// Authentify an `user` with his `token`
  /// for next requests to API.
  Future<void> _auth(String token, User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    username = user.name;
    accountType = user.premium ? 'premium' : 'basic';

    sharedPreferences.clear();
    sharedPreferences.setString('token', token);
    sharedPreferences.setString('user', jsonEncode(user.toJson()));
    sharedPreferences.setBool('firstLaunch', false);
  }

  /// Disconnect the logged user.
  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.setBool('firstLaunch', false);

    worker.navigatorKey.currentState.pushNamed('/login');
  }

  /// Check if user is connected by retrieving token then
  /// send request to backend to check if logged in token is correct.
  Future<bool> check() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token');
      bool connected = false;
      if (token == null) return false;

      await worker.get("/check/$token").then((response) {
        connected = response.statusCode == 200;

        if (connected) {
          String json = sharedPreferences.getString('user');
          User user = User.fromJson(jsonDecode(json));

          username = user.name;
          accountType = user.premium ? 'premium' : 'basic';
        }
      }).catchError((e) {
        print(e);
        return false;
      });

      return connected;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  /// Return the logged user or `false`
  /// if there's no logged in user.
  Future<dynamic> user() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String json = sharedPreferences.getString('user');

      if (json.isNotEmpty) {
        User user = User.fromJson(jsonDecode(json));
        username = user.name;
        accountType = user.premium ? 'premium' : 'basic';

        return User.fromJson(jsonDecode(json));
      } else
        return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Return the `token` of the logged `user`
  Future<String> token() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token');

      return token;
    } catch (e) {
      print(e);
      return '';
    }
  }

  /// Log in user using given `email` and `password`.
  Future<dynamic> login(String email, String password) async {
    try {
      Map<String, dynamic> credentials = {'email': email, 'password': password};
      Response response = await worker.post("/login", params: credentials);

      if (response.statusCode != 200) {
        print(response.data);
        return false;
      } else {
        String token = response.data['token'];
        User user = User.fromJson(response.data['user']);
        await _auth(token, user).then((value) => worker.check());

        worker.navigatorKey.currentState.pushReplacementNamed("/dashboard");
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  /// Register user with given `data`.
  /// Set `data['premium'] = true` and user
  /// `data['card']` info if you want registration to be premium.
  Future<dynamic> register(Map<String, dynamic> data) async {
    try {
      Response response = await worker.post("/register", params: data);

      if (response.statusCode != 201) {
        print(response.data);
        return false;
      } else {
        String token = response.data['token'];
        User user = User.fromJson(response.data['user']);

        if (token != null) {
          await _auth(token, user).then((value) => worker.check());

          worker.navigatorKey.currentState.pushReplacementNamed("/welcome");
        }
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

final AuthService auth = AuthService();
