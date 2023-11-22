import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/location.dart';

class Employee {
  String name;
  String email;
  Company company;
  Location location;
  String category;
  int? currentSequenceNumber;
  int? queueCount;

  Employee(
      {required this.name,
      required this.email,
      required this.company,
      required this.location,
      required this.category,
      this.currentSequenceNumber,
      this.queueCount});
    
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      email: json['email'],
      company: Company.fromJson(json['company']),
      location: Location.fromJson(json['location']),
      category: json['category'],
      currentSequenceNumber: json['currentSequenceNumber'],
      queueCount: json['queueCount'],
    );
  }
}
