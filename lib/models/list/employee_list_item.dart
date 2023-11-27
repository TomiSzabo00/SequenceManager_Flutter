import 'package:sequence_manager/models/employee.dart';
import 'package:sequence_manager/models/list/list_item.dart';

class EmployeeListItem extends ListItem {
  EmployeeListItem({
    required this.employee,
  }) : super(title: employee.name, subtitle: "${employee.location.name} - ${employee.category.name}");

  final Employee employee;
}