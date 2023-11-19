import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/screens/global/list_viewmodel.dart';

class ModeratorViewModel extends ListViewModel {
  Future<List<ListItem>> fetchLocations() {
    final mockList = [
      ListItem(title: "Loc 1"),
      ListItem(title: "Loc 2"),
      ListItem(title: "Loc 3"),
    ];
    return Future.value(mockList);
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

  void addNewLocation() {}

  void addNewCategory() {}

  void addNewEmployee() {}

  void editLocation(ListItem item) {}

  void editCategory(ListItem item) {}

  void editEmployee(ListItem item) {}

  void deleteLocation(ListItem item) {}

  void deleteCategory(ListItem item) {}

  void deleteEmployee(ListItem item) {}
}
