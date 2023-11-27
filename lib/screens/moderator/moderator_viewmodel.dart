import 'package:flutter/cupertino.dart';
import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/list/employee_list_item.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/list/location_list_item.dart';
import 'package:sequence_manager/models/location.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';
import '../../models/category.dart';
import '../../models/list/category_list_item.dart';

class ModeratorViewModel extends AlertViewModel {

  TextEditingController locationController = TextEditingController();
  List<LocationListItem> locations=[];

  TextEditingController categoryController = TextEditingController();
  List<CategoryListItem> categories =[];

  Future<List<ListItem>> fetchLocations() async {
    try {
      return await API.instance.getLocations().then((value) {
        notifyListeners();
        return locations = value.map((e) => LocationListItem(location: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  void deleteLocation(Location location) async {
    try {
      await API.instance.deleteLocation(location).then((value){
        notifyListeners();
        locations.removeWhere((element)=>element.location.name==location.name);
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  void updateLocation(Location location) async {
    try {
      await API.instance.updateLocation(location, locationController.text).then((value) {
        location.name = locationController.text;
        notifyListeners();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  Future<List<ListItem>> createLocation(String text) {
    try{
      return API.instance.createLocation(text).then((value) {
        notifyListeners();
        return locations = value.map((e) => LocationListItem(location: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return Future.value([]);
    }
  }

  Future<List<ListItem>> fetchCategories(Location location) async {
    try {
      return await API.instance.getCategories(location).then((value) {
        notifyListeners();
        return categories = value.map((e) => CategoryListItem(category: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  void deleteCategory(Location location, Category category) async {
    try {
      await API.instance.deleteCategory(location, category).then((value){
        notifyListeners();
        categories.removeWhere((element)=>element.category.name==category.name);
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  void updateCategory(Location location, Category category) async {
    try {
      await API.instance.updateCategory(location, category, categoryController.text).then((value){
        category.name=categoryController.text;
        notifyListeners();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  Future<List<ListItem>> createCategory(Location location, String text) {
    try{
      return API.instance.createCategory(location, text).then((value) {
        notifyListeners();
        return categories = value.map((e) => CategoryListItem(category: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return Future.value([]);
    }
  }

  Future<List<ListItem>> fetchEmployees() {
    try {
      return API.instance.getEmployees().then((value) {
        notifyListeners();
        return value.map((e) => EmployeeListItem(employee: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return Future.value([]);
    }
  }

  void reset() {

  }
}
