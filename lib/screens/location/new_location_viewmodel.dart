import 'package:flutter/material.dart';

class NewLocationViewModel extends ChangeNotifier {
  String _name="";

  String get getName=>_name;

  void setName(String name){
    _name=name;
  }

  void save(){

  }
}