import 'package:flutter/material.dart';
import 'package:sequence_manager/models/user.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLogin = true;
  User? loggedInUser = null;

  void setLogin(bool value) {
    isLogin = value;
    notifyListeners();
  }

  void mockLogin() {
    loggedInUser = User(name: "Test", email: "email@emial.com");
    notifyListeners();
  }

  Stream<User?> listenToLoginState() async* {
    yield loggedInUser;
    // yield User(name: "Test", email: "email@email.com");
  }
}
