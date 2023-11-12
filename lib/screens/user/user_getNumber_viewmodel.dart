import 'package:flutter/material.dart';

class UserGetNumberViewModel extends ChangeNotifier {
  String? _place="";
  String? _category="";

  String? get getPlace=>_place;

  void setPlace(String? place){
    _place=place;
  }

  List<String> getPlaces(){
    return ["loc A", "loc B"];
  }

  String? get getCategory => _category;

  void setCategory(String? category){
    _category=category;
  }

  List<String> getCategories(){
    return ["Cat A", "Cat B"];
  }

  void getNumber(){

  }
}