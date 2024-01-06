import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiHelper {

  static Future<http.Response?> postRequest(
      {String? apiUrl,
      dynamic body,
        dynamic language,
      dynamic isLoading = true,
      String? token}) async {


    try {

      Map<String, String> headers = {
        'custom-token': token ?? '',
      };


      var response = await http.post(Uri.parse('$apiUrl'), body: body, headers: headers);
      final jsonString = response.body;
      final decodeJson = json.decode(jsonString);


      if (decodeJson['code'] == 400) {
        if(error == "1") {

          error = "0";
        }
      }
      else {

        return response;
      }
    }
    catch (ex) {

      
      throw ('API EXCEPTION  <<<<>>>>>>> $ex');
    }
    finally {

      
    }
    return null;
  }


  
  static Future<http.Response?> getRequest({
    String? apiUrl,
    token,
    dynamic language,
  }) async {
    try {


      Map<String, String> headers = {
        'custom-token': token.toString(),
        
      };

      var response = await http.get(Uri.parse('$apiUrl'), headers: headers);
      final jsonString = response.body;
      final decodeJson = json.decode(jsonString);

      if (decodeJson['code'] == 400) {
        if(error == "1") {
          error = "0";
        }
      }
      else {
        return response;
      }
      return response;
    } catch (ex) {
      throw ('API EXCEPTION  <<<<>>>>>>> $ex');
    } finally {}
  }

  static String error = "";


}

