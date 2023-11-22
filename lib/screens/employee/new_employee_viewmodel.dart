import 'package:flutter/material.dart';

class NewEmployeeViewModel extends ChangeNotifier {
  String _name="";
  String? _location;
  String? _category;

  String get getName => _name;

  void setName(String name){
    _name=name;
    notifyListeners();
  }

  String? get getLocation => _location;

  List<String> getLocations(){
    return ["loc A", "loc B"];
  }

  void setLocation(String? location){
    _location=location;
    notifyListeners();
  }

  String? get getCategory => _category;

  List<String> getCategories(){
    return ["cat A", "cat B"];
  }

  void setCategory(String? category){
    _category=category;
    notifyListeners();
  }

  void save(){

  }
}