import 'package:flutter/material.dart';

class NewCategoryViewModel extends ChangeNotifier {
  String _name = "";

  String get getName => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void save(){

  }
}