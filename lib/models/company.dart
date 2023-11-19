import 'package:sequence_manager/models/user.dart';

class Company {
  final String id;
  final String name;
  List<User> managers = [];

  Company({
    required this.id,
    required this.name,
  });
}
