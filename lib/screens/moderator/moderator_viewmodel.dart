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
        locations = value.map((e) => LocationListItem(location: e)).toList();
        return locations;
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  Future<List<ListItem>> fetchCategories(Location location) async {
    try {
      return await API.instance.getCategories(location).then((value) {
        categories = value.map((e) => CategoryListItem(category: e)).toList();
        return categories;
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  Future<List<ListItem>> fetchEmployees() {
    try {
      return API.instance.getEmployees().then((value) {
        return value.map((e) => EmployeeListItem(employee: e)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return Future.value([]);
    }
  }

  void deleteLocation(Location item) {
    try {
      API.instance.removeLocation(item).then((value){
        locations.removeWhere((element) => element.location.name == item.name);
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  void updateLocation(Location location){
    try {
      API.instance.updateLocation(location, locationController.text).then((value) {
        location.name = locationController.text;
        notifyListeners();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  void deleteCategory(Location location, Category category) {
    try {
      API.instance.removeCategory(location, category).then((value){
        categories.removeWhere((element)=>element.category.name==category.name);
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  void updateCategory(Location location, Category category){
    try {
      API.instance.updateCategory(location, category, categoryController.text).then((value){
        category.name=locationController.text;
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
    }
  }

  void deleteEmployee(ListItem item) {

  }
}
