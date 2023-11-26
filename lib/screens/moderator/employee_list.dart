import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/list/employee_list_item.dart';
import '../../models/list/list_item.dart';
import '../employee/edit_employee.dart';
import '../employee/employee_viewmodel.dart';
import '../employee/new_employee.dart';
import '../global/alert_wrapper.dart';

import 'moderator_viewmodel.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  EmployeesListState createState() => EmployeesListState();
}

class EmployeesListState extends State<EmployeesList> {
  late Future<List<ListItem>> fetchEmployees;


  @override
  void initState() {
    super.initState();
    fetchEmployees = Provider.of<EmployeeViewModel>(context, listen: false)
        .fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = EmployeeViewModel();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Employees"),
        ),
        body: AlertWrapper<EmployeeViewModel>(
          viewModel: viewModel,
          builder: (_, __) => Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: viewModel.fetchEmployees(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!;
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(data[index].title),
                                subtitle: data[index].subtitle.isEmpty
                                    ? null
                                    : Text(data[index].subtitle),
                                trailing: PopupMenuButton(
                                  onSelected: (value) {
                                    if (value == "update") {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => EditEmployeeScreen(
                                              employee: (data[index] as EmployeeListItem).employee),
                                        ),
                                      ).then((_) {
                                        setState(() {
                                          viewModel.reset();
                                          fetchEmployees = Provider.of<EmployeeViewModel>(context, listen: false).fetchEmployees();
                                        });
                                      });
                                    } else if (value == "delete") {
                                      viewModel.removeEmployee(
                                          (data[index] as EmployeeListItem).employee
                                      );
                                      setState(() {
                                        viewModel.reset();
                                        fetchEmployees = Provider.of<EmployeeViewModel>(context, listen: false).fetchEmployees();
                                      });
                                    }
                                  },
                                  itemBuilder: (context) {
                                    return [
                                      const PopupMenuItem(
                                        value: "update",
                                        child: Text("Edit employee"),
                                      ),
                                      const PopupMenuItem(
                                        value: "delete",
                                        child: Text("Delete"),
                                      ),
                                    ];
                                  },
                                ),
                                contentPadding: const EdgeInsets.all(0),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NewEmployeeScreen(),
                          ),
                        ).then((_) {
                          setState(() {
                            viewModel.reset();
                            fetchEmployees = Provider.of<EmployeeViewModel>(context, listen: false).fetchEmployees();
                          });
                        });
                      },
                      child: const Text(
                        "Add new",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        )
    );
  }
}