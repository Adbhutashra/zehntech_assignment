import 'package:http/http.dart' as http;
import 'package:zehntech_assignment/Network/apiHelper.dart';
import 'package:zehntech_assignment/Network/urls.dart';

class Repository {

  static Future<http.Response?> loginRepo({username, password}) async {

    Map<String, String> body = {
      'username': username,
      'password': password,
    };

    try {
      final response = await ApiHelper.postRequest(
        apiUrl:BASE_URL+ LOGIN,
        body: body,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future<http.Response?> usersRepo() async {
    try {
      final response = await ApiHelper.getRequest(
        apiUrl: BASE_URL+ GET_USERS,
      );
      return response;
    } catch (e) {
      return null;
    }
  }


}
