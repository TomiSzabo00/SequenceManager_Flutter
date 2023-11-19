import 'package:sequence_manager/models/list_item.dart';
import 'package:sequence_manager/screens/global/list_viewmodel.dart';

class AdminViewModel extends ListViewModel {
  @override
  void addNewItem() {
    // TODO: implement addNewItem
  }

  @override
  void deleteItem() {
    // TODO: implement deleteItem
  }

  @override
  void updateItem() {
    // TODO: implement updateItem
  }

  @override
  Future<List<ListItem>> fetchItems() {
    final mockList = [
      ListItem(title: "Comp 1"),
      ListItem(title: "Comp 2"),
      ListItem(title: "Comp 3"),
    ];
    return Future.value(mockList);
  }
}
