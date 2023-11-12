import 'package:flutter/material.dart';

class EditCategoryViewModel extends ChangeNotifier {
  String _name = "";

  String get getName => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void save(){

  }
}