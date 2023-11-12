import 'package:flutter/material.dart';

class AddManagerViewModel extends ChangeNotifier {
  String _place="";
  String _name="";

  String get getPlace=> _place;

  void setPlace(String place){
    _place=place;
  }

  String get getName=>_name;

  void setName(String name){
    _name=name;
  }

  void save(){

  }
}