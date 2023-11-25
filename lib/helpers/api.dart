import 'dart:convert';
import 'package:sequence_manager/models/category.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/employee.dart';
import 'package:sequence_manager/models/helper/manager_data.dart';
import 'package:sequence_manager/models/location.dart';
import 'package:sequence_manager/models/sequence.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';

class API {
  API._privateConstructor();
  static final API instance = API._privateConstructor();

  bool _isConnectedToWebSocket = false;

  factory API() {
    return instance;
  }

  final String _baseURL = "http://localhost:8080/api";
  String get baseURL => _baseURL;
  Map<String, String> header = {
    "Content-Type": "application/json",
    "Connection": "keep-alive",
  };

  Future<User> login(String email, String password) async {
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
      updateCookie(response);
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> logout() async {
    final url = Uri.parse("$_baseURL/auth/logout");
    final response = await http.delete(url, headers: header);

    if (response.statusCode == 204) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<List<Location>> getLocations() {
    // Uncomment for debug prints
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
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

  Future<List<Category>> getCategories(Location location) {
    // Uncomment for debug prints
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse(
        "$_baseURL/moderators/company/locations/${location.name}/services");
    return http.get(url, headers: header).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List<dynamic>;
        return json.map((e) => Category.fromJson(e)).toList();
      } else {
        throw errorMessageFromResponse(response.body);
      }
    });
  }

  Future<List<Employee>> getEmployees() {
    // Uncomment for debug prints
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/moderators/company/employees");
    return http.get(url, headers: header).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List<dynamic>;
        return json.map((e) => Employee.fromJson(e)).toList();
      } else {
        throw errorMessageFromResponse(response.body);
      }
    });
  }

  Future<List<Company>> getCompanies() {
    // Uncomment for debug prints
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/admin/companies");
    return http.get(url, headers: header).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final companies = json["companies"] as List<dynamic>;
        return companies.map((e) => Company.fromString(e)).toList();
      } else {
        throw errorMessageFromResponse(response.body);
      }
    });
  }

  Future<List<ManagerData>> getManagers(Company company) {
    // Uncomment for debug prints
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/admin/companies/${company.name}");
    return http.get(url, headers: header).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List<dynamic>;
        return json.map((e) => ManagerData.fromJson(e)).toList();
      } else {
        throw errorMessageFromResponse(response.body);
      }
    });
  }

  Future<void> removeManager(Company company, ManagerData manager) async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse(
        "$_baseURL/admin/companies/${company.name}/moderators/${manager.email}");
    final response = await http.delete(url, headers: header);

    if (response.statusCode == 200) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<ManagerData> addManager(Company company, String email) async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/admin/company/moderators");
    final body = {
      "company": company.name,
      "email": email,
    };
    final response =
        await http.post(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 201) {
      return ManagerData.fromJson(jsonDecode(response.body));
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> updateCompanyName(Company company, String newName) async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/admin/companies");
    final body = {
      "previousCompanyName": company.name,
      "newCompanyName": newName,
    };
    final response =
        await http.patch(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<ManagerData> getManagerData(String email) async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/admin/emails/$email/validate");
    final response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
      return ManagerData.fromJson(jsonDecode(response.body));
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> createCompany(String name, List<String> emails) async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/admin/companies");
    final body = {
      "companyName": name,
      "employeeEmailList": emails,
    };
    final response =
        await http.post(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 201) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> updateUserRole(String email, UserType type) async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/admin/manage-user");
    final body = {
      "email": email,
      "role": type.jsonName,
    };
    final response =
        await http.patch(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<List<Company>> getCompaniesForUser() async {
    final url = Uri.parse("$_baseURL/users/companies");
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final companies = json["companies"] as List<dynamic>;
      return companies.map((e) => Company.fromString(e)).toList();
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<List<Location>> getLocationsForCompanyForUser(Company company) async {
    final url = Uri.parse("$_baseURL/users/locations");
    final body = {
      "company": company.name,
    };
    final response =
        await http.post(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final locations = json["locations"] as List<dynamic>;
      return locations.map((e) => Location.fromString(e)).toList();
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<List<Category>> getCategoriesForLocationForUser(
      Company company, Location location) async {
    final url = Uri.parse("$_baseURL/users/services");
    final body = {
      "company": company.name,
      "location": location.name,
    };
    final response =
        await http.post(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final categories = json["services"] as List<dynamic>;
      return categories.map((e) => Category.fromString(e)).toList();
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<Sequence> getSequenceForUser(
      Company company, Location location, Category category) async {
    final url = Uri.parse("$_baseURL/users/sequence");
    final body = {
      "company": company.name,
      "location": location.name,
      "service": category.name,
    };
    final response =
        await http.post(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return Sequence.fromJson(json);
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> removeCategory(Location location, Category category) async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse(
        "$_baseURL/moderators/company/locations/${location.name}/services/${category.name}");
    final response = await http.delete(url, headers: header);

    if (response.statusCode == 200) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> removeLocation(Location location) async {
    final url =
        Uri.parse("$_baseURL/moderators/company/locations/${location.name}");
    final response = await http.delete(url, headers: header);

    if (response.statusCode == 200) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> updateLocation(Location location, String text) async {
    final url = Uri.parse("$_baseURL/moderators/company/locations");
    final body = {
      "previousLocationName": location.name,
      "newLocationName": text
    };
    final response =
        await http.patch(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> updateCategory(
      Location location, Category category, String text) async {
    final url = Uri.parse(
        "$_baseURL/moderators/company/locations/${location.name}/services");
    final body = {"previousServiceName": category.name, "newServiceName": text};
    final response =
        await http.patch(url, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<void> deleteSequenceForUser() async {
    // HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    //   HttpLogger(logLevel: LogLevel.BODY),
    // ]);
    final url = Uri.parse("$_baseURL/users/sequence");
    final response = await http.delete(url, headers: header);

    if (response.statusCode == 204) {
      return;
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  Future<Sequence> getUserDashboard() async {
    final url = Uri.parse("$_baseURL/users");
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return Sequence.fromJson(json);
    } else {
      throw errorMessageFromResponse(response.body);
    }
  }

  // MARK: """Websocket"""
  Stream<Sequence?> listenToSequenceChanges(User user) async* {
    while (_isConnectedToWebSocket) {
      print("Listening to sequence changes");
      final url = Uri.parse("$_baseURL/users");
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        yield Sequence.fromJson(json);
      } else {
        yield null;
      }

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void connectToWebSocket() {
    _isConnectedToWebSocket = true;
  }

  void disconnectFromWebSocket() {
    _isConnectedToWebSocket = false;
  }

  // MARK: Helpers

  String errorMessageFromResponse(String response) {
    if (response.isEmpty) {
      return "Something went wrong";
    }
    final json = jsonDecode(response) as Map<String, dynamic>;
    return json["message"];
  }

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      header['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
