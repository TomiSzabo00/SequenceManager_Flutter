import 'package:flutter/cupertino.dart';
import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/employee.dart';
import 'package:sequence_manager/models/helper/employee_data.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

import '../../models/category.dart';
import '../../models/list/employee_list_item.dart';
import '../../models/list/location_list_item.dart';
import '../../models/location.dart';

class EmployeeViewModel extends AlertViewModel {

  String? email;
  Location? selectedLocation;
  Category? selectedCategory;

  bool get canSelectCategory => selectedLocation != null;

  bool get isAllSelected =>
      selectedLocation != null && selectedCategory != null;

  List<LocationListItem> locations=[];

  TextEditingController employeeController = TextEditingController();

  void setLocation(String? value) {
    selectedLocation = Location(name: value ?? "");
    selectedCategory = null;
    notifyListeners();
  }

  void setCategory(String? value) {
    selectedCategory = Category(name: value ?? "");
    notifyListeners();
  }

  void reset() {
    selectedLocation = null;
    selectedCategory = null;
    locations=[];
    notifyListeners();
    employeeController.text="";
  }

  List<EmployeeListItem> employees=[];

  Future<EmployeeData?> fetchEmployeeData() async {
    try {
      return await API.instance.fetchEmployeeData();
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<EmployeeData?> callNext() async {
    try {
      return await API.instance.callNextCustomer();
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<List<EmployeeListItem>> fetchEmployees() async {
    try {
      return API.instance.getEmployees().then((value) {
        employees = value
            .map((e) => EmployeeListItem(
            employee:
              Employee(name: e.name, email: e.email, location: e.location, category: e.category)))
            .toList();
        return employees;
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return Future.value([]);
    }
  }

  Future<List<EmployeeListItem>> updateEmployee(Employee employee, Location? location, Category? category) async {
    try {
      return await API.instance.updateEmployee(employee, location!, category!).then((value){
        notifyListeners();
        return employees = value.map((e) => EmployeeListItem(employee: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return Future.value([]);
    }
  }


  void removeEmployee(Employee employee) async {
    try {
      await API.instance.deleteEmployee(employee).then((value){
        notifyListeners();
        employees.removeWhere((element)=>element.employee.email==employee.email);
      });
      notifyListeners();
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  Future<List<EmployeeListItem>> addEmployee(String employee, Location? location, Category? category) async {
    try {
      return await API.instance.addEmployee(employee, location!, category!).then((value) {
        notifyListeners();
        employees = value
            .map((e) => EmployeeListItem(
            employee:
            Employee(name: e.name, email: e.email, location: e.location, category: e.category)))
            .toList();
        return employees;
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return Future.value([]);
    }
  }

  Future<List<String>> fetchLocations() async {
    try {
      return API.instance.getLocations().then((value) {
        notifyListeners();
        return value.map((e) => e.name).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  Future<List<String>> fetchCategories(Location location) async {
    try {
      return API.instance
          .getCategories(location)
          .then((value) {
        notifyListeners();
        return value.map((e) => e.name).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }
}
