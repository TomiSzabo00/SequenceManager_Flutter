import 'package:flutter/material.dart';
import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/list/company_list_item.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/list/user_list_item.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

class AdminViewModel extends AlertViewModel {
  TextEditingController nameController = TextEditingController();
  List<UserListItem> managers = [];

  bool isNameValid = true;

  Future<List<CompanyListItem>> fetchCompanies() async {
    try {
      return API.instance.getCompanies().then((value) {
        return value.map((e) => CompanyListItem(company: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  void deleteCompany(ListItem item) {}

  Future<List<UserListItem>> fetchManagers(Company company) {
    final mockList = [
      UserListItem(
          user: User(
              name: "User 1",
              email: "email1@test.com",
              type: UserType.manager)),
      UserListItem(
          user: User(
              name: "User 2",
              email: "email2@test.com",
              type: UserType.manager)),
    ];
    return Future.value(mockList);
  }

  void deleteManager(ListItem item) {}

  void addCompany() {
    validateName();
    if (!isNameValid) {
      return;
    }
  }

  void validateName() {
    isNameValid = nameController.text.isNotEmpty;
    notifyListeners();
  }
}
