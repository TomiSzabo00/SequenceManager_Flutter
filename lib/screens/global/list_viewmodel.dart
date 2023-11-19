import 'package:flutter/material.dart';

abstract class ListViewModel extends ChangeNotifier {
  List<dynamic> items = [];
  
  void addNewItem();
  void deleteItem();
  void updateItem();
}