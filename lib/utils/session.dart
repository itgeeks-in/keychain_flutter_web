import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

class Session {
  setToken(String token) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('token', token); //Todo storing token
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return (token ?? "");
  }

  setLoginUserData(String jsonString) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('LoginUser', jsonString); //storing
  }

  Future<dynamic> getLoginUserData(String s) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? user = sharedPref.getString('LoginUser');
    Map decodeOptions = jsonDecode(user!);
    return UserDataModel.fromJson(decodeOptions);
  }

  Future<bool> check() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if (sharedPref.containsKey("LoginUser")) {
      return true;
    } else {
      return false;
    }
  }

  // Todo : call when logout
  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("LoginUser");
  }
}
