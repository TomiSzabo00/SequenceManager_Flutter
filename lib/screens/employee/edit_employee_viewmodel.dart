import 'package:flutter/material.dart';

class EditEmployeeViewModel extends ChangeNotifier {
  String _name="";
  String? _location;
  String? _category;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  String get getName => _name;

  void setLocation(String? location) {
    _location = location;
    notifyListeners();
  }

  List<String> getLocations(){
    return ["loc A", "loc B"];
  }

  String? get getLocation => _location;

  void setCategory(String? category) {
    _category = category;
    notifyListeners();
  }

  List<String> getCategories(){
    return ["cat A", "cat B"];
  }

  String? get getCategory => _category;

  void save(){

  }


}