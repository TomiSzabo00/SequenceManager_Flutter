import 'package:flutter/material.dart';

class EmployeeViewModel extends ChangeNotifier {
  int _calledNumber= 0;
  String _place= "";

  int get getCalledNumber => _calledNumber;

  void setCalledNumber(int calledNumber){
    _calledNumber=calledNumber;
    notifyListeners();
  }

  String get getPlace => _place;

  void setPlace(String place){
    _place=place;
    notifyListeners();
  }

  void next(){

  }
}