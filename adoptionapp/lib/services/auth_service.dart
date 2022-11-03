import 'package:plant_app/services/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // _setHeaders() => {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     };

  Future login({required Map<String, String> payload}) async {
    var url = Uri.parse('${Constants.baseUrl}/login');
    http.Response response = await http.post(
      url,
      headers: Constants.headers,
      body: payload,
    );

    // Set Token coming from backend
    _setToken(json.decode(response.body)['token']);

    return response;
  }

  Future register({required Map<String, String> payload}) async {
    var url = Uri.parse('${Constants.baseUrl}/register');
    http.Response response = await http.post(
      url,
      headers: Constants.headers,
      body: payload,
    );

    return response;
  }

  void _setToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }

  // void _getToken() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   token = pref.getString('token');
  // }
}
