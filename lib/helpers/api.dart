import 'dart:convert';
import 'package:sequence_manager/models/location.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:http/http.dart' as http;
// Uncomment for debug prints
import 'package:pretty_http_logger/pretty_http_logger.dart';

class API {
  static const String _baseURL = "http://localhost.proxyman.io:8080/api";
  static String get baseURL => _baseURL;
  static Map<String, String> get header => {
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      };

  static Future<User> login(String email, String password) async {
    // Uncomment for debug prints
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);

    final url = Uri.parse("$_baseURL/auth/login");
    final body = {
      "email": email,
      "password": password,
    };

    final response =
        await http.post(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  static Future<void> logout() async {
    final url = Uri.parse("$_baseURL/auth/logout");
    final response = await http.delete(url, headers: header);

    if (response.statusCode == 204) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  static Future<List<Location>> getLocations() {
    // Uncomment for debug prints
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    final url = Uri.parse("$_baseURL/moderators/company/locations");
    return http.get(url, headers: header).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List<dynamic>;
        return json.map((e) => Location.fromJson(e)).toList();
      } else {
        throw errorMessageFromResponse(response.body);
      }
    });
  }

  static String errorMessageFromResponse(String response) {
    final json = jsonDecode(response) as Map<String, dynamic>;
    return json["errorType"];
  }
}
