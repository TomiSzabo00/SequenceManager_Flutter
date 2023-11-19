import 'package:sequence_manager/models/list_item.dart';
import 'package:sequence_manager/screens/global/list_viewmodel.dart';

class AdminViewModel extends ListViewModel {
  Future<List<ListItem>> fetchCompanies() {
    final mockList = [
      ListItem(title: "Comp 1"),
      ListItem(title: "Comp 2"),
      ListItem(title: "Comp 3"),
    ];
    return Future.value(mockList);
  }

  void addNewCompany() {}

  void editCompany(ListItem item) {}

  void deleteCompany(ListItem item) {}
}
