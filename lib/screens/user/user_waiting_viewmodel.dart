import 'package:flutter/material.dart';

class UserWaitingViewModel extends ChangeNotifier {
  int _number=-1;
  int _peopleAhead=0;
  String _place="";

  int get getNumber=>_number;

  void setNumber(int number){
    _number=number;
  }

  int get getPeopleAhead=>_peopleAhead;

  void setPeopleAhead(int peopleAhead){
    _peopleAhead=peopleAhead;
  }

  String get getPlace => _place;

  void setPlace(String place){
    _place=place;
  }

  void delete(){

  }
}