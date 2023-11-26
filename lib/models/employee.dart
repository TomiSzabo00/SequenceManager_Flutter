import 'package:sequence_manager/models/category.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/location.dart';

class Employee {
  String name;
  String email;
  Company? company;
  String location;
  String category;
  int? currentSequenceNumber;
  int? queueCount;

  Employee(
      {required this.name,
      required this.email,
      this.company,
      required this.location,
      required this.category,
      this.currentSequenceNumber,
      this.queueCount});
    
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      email: json['email'],
      company: Company.fromString(json['company']),
      location: json['location'],
      category: json['service'],
      currentSequenceNumber: json['currentSequenceNumber'],
      queueCount: json['queueCount'],
    );
  }
}
