import 'package:flutter/material.dart';
import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/helper/manager_data.dart';
import 'package:sequence_manager/models/list/company_list_item.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/list/user_list_item.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

class AdminViewModel extends AlertViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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

  Future<void> deleteCompany(ListItem item) async {
    try {
      await API.instance.delteCompany((item as CompanyListItem).company);
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  Future<List<UserListItem>> fetchManagers(Company company) async {
    try {
      return API.instance.getManagers(company).then((value) {
        managers = value
            .map((e) => UserListItem(
                user:
                    User(name: e.name, email: e.email, type: UserType.manager)))
            .toList();
        return managers;
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  void deleteManager(Company company, ManagerData manager) {
    API.instance.removeManager(company, manager).then((value) {
      managers.removeWhere((element) => element.user.email == manager.email);
      notifyListeners();
    }).catchError((e) {
      alertMessage = e.toString();
      notifyListeners();
    });
  }

  void createCompany() {
    validateName();
    if (!isNameValid) {
      return;
    }
    if (managers.isEmpty) {
      alertMessage = "Please add at least one manager";
      notifyListeners();
      return;
    }

    try {
      API.instance
          .createCompany(
              nameController.text, managers.map((e) => e.user.email).toList())
          .then((value) {});
      reset();
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void validateName() {
    isNameValid = nameController.text.isNotEmpty;
    notifyListeners();
  }

  void addManager(Company company) {
    API.instance.addManager(company, emailController.text).then((e) {
      managers.add(UserListItem(
          user: User(name: e.name, email: e.email, type: UserType.manager)));
      notifyListeners();
    }).catchError((e) {
      alertMessage = e.toString();
      notifyListeners();
    });
  }

  void updateCompanyName(Company company, String newName) {
    try {
      API.instance.updateCompanyName(company, newName).then((value) {
        company.name = newName;
        notifyListeners();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  void reset() {
    nameController.text = "";
    emailController.text = "";
    managers = [];
    isNameValid = true;
    notifyListeners();
  }

  void addNewManagerCreatingCompany() async {
    try {
      await API.instance.getManagerData(emailController.text).then((value) {
        managers.add(UserListItem(
            user: User(
                name: value.name, email: value.email, type: UserType.manager)));
        notifyListeners();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      rethrow;
    }
    emailController.text = "";
  }

  void removeManagerCreatingCompany(UserListItem manager) {
    managers.remove(manager);
    notifyListeners();
  }
}
