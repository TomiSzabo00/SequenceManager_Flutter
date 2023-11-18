import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:http/http.dart' as http;

class API {
  static const String _baseURL = "http://localhost:8080";
  static String get baseURL => _baseURL;

  static Future<User?> login(String email, String password) async {
    final url = Uri.parse("$_baseURL/login");
    final body = {
      "email": email,
      "password": password,
    };

    final response =
        await http.post(url, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return User.fromJson(response.body as Map<String, dynamic>);
    } else {
      if (kDebugMode) {
        print("body: ${jsonEncode(body)}");
        print("headers: ${response.headers}\nrespCode: ${response.statusCode}\nrespBody: ${response.body}");
      }
      // throw Exception(response.body);
      return null;
    }
  }
}
