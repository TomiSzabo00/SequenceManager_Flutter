import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

class ModeratorViewModel extends AlertViewModel {
  Future<List<ListItem>> fetchLocations() async {
    try {
      return await API.instance.getLocations().then((value) {
        return value.map((e) => ListItem(title: e.name)).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  Future<List<ListItem>> fetchCategories() {
    final mockList = [
      ListItem(title: "Cat 1"),
      ListItem(title: "Cat 2"),
      ListItem(title: "Cat 3"),
    ];
    return Future.value(mockList);
  }

  Future<List<ListItem>> fetchEmployees() {
    final mockList = [
      ListItem(title: "Empl 1"),
      ListItem(title: "Empl 2"),
      ListItem(title: "Empl 3"),
    ];
    return Future.value(mockList);
  }

  void editLocation(ListItem item) {}

  void editCategory(ListItem item) {}

  void editEmployee(ListItem item) {}

  void deleteLocation(ListItem item) {}

  void deleteCategory(ListItem item) {}

  void deleteEmployee(ListItem item) {}
}
