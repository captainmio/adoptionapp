import 'package:plant_app/services/constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future login({required Map<String, String> payload}) async {
    var url = Uri.parse('${Constants.baseUrl}/login');
    http.Response response = await http.post(
      url,
      headers: Constants.headers,
      body: payload,
    );

    return response;
  }

  Future register({required Map<String, String> payload}) async {}
}
