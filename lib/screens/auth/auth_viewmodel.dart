import 'package:flutter/material.dart';
import 'package:sequence_manager/models/user.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLogin = true;
  User? loggedInUser;

  // textfield controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  // controller validators
  bool isNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isPasswordAgainValid = true;

  void setLogin(bool value) {
    isLogin = value;
    isEmailValid = true;
    isPasswordValid = true;
    isPasswordAgainValid = true;
    isNameValid = true;
    notifyListeners();
  }

  Stream<User?> listenToLoginState() async* {
    yield loggedInUser;
  }

  void login() {
    // check if email and password is valid
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text)) {
      isEmailValid = false;
      notifyListeners();
      return;
    }
    if (passwordController.text.isEmpty) {
      isPasswordValid = false;
      notifyListeners();
      return;
    }

    loggedInUser = User(name: "Test", email: "email@emial.com");
    notifyListeners();
  }

  void register() {
    // check if name, email, password and password again is valid
    if (nameController.text.isEmpty) {
      isNameValid = false;
      notifyListeners();
      return;
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text)) {
      isEmailValid = false;
      notifyListeners();
      return;
    }
    if (passwordController.text.isEmpty) {
      isPasswordValid = false;
      notifyListeners();
      return;
    }
    if (passwordController.text != passwordAgainController.text) {
      isPasswordAgainValid = false;
      notifyListeners();
      return;
    }

    loggedInUser = User(name: "Test", email: "email@emial.com");
    notifyListeners();
  }

  void logout() {
    loggedInUser = null;
    notifyListeners();
  }
}
