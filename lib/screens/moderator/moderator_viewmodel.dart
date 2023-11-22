import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/list/employee_list_item.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/list/location_list_item.dart';
import 'package:sequence_manager/models/location.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

class ModeratorViewModel extends AlertViewModel {
  Future<List<ListItem>> fetchLocations() async {
    try {
      return await API.instance.getLocations().then((value) {
        return value.map((e) => LocationListItem(location: e)).toList();
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
        return value.map((e) => ListItem(title: e.name)).toList();
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

  void deleteLocation(ListItem item) {}

  void deleteCategory(ListItem item) {}

  void deleteEmployee(ListItem item) {}
}
