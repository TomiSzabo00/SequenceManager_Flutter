import 'package:flutter/material.dart';
import 'package:sequence_manager/models/list_item.dart';

abstract class ListViewModel extends ChangeNotifier {  
  void addNewItem();
  void deleteItem();
  void updateItem();
  Future<List<ListItem>> fetchItems();
}