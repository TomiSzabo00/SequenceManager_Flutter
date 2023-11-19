import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list_item.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  EmployeeListState createState() => EmployeeListState();
}

class EmployeeListState extends State<EmployeeList> {
  late Future<List<ListItem>> fetchEmployees;

  @override
  void initState() {
    super.initState();
    fetchEmployees = Provider.of<ModeratorViewModel>(context, listen: false)
        .fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ModeratorViewModel>();
    return AddNewList(
      title: "Employees",
      fetchItems: fetchEmployees,
      updateItem: viewModel.editEmployee,
      deleteItem: viewModel.deleteEmployee,
    );
  }
}
