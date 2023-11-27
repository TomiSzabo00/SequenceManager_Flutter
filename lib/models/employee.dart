import 'package:sequence_manager/models/category.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/location.dart';

class Employee {
  String name;
  String email;
  Company? company;
  Location location;
  Category category;
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
      location: Location.fromString(json['location']),
      category: Category.fromString(json['category']),
      currentSequenceNumber: json['currentSequenceNumber'],
      queueCount: json['queueCount'],
    );
  }
}
