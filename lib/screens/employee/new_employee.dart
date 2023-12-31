import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../global/alert_wrapper.dart';
import 'employee_viewmodel.dart';

class NewEmployeeScreen extends StatefulWidget {
  const NewEmployeeScreen({super.key});

  @override
  NewEmployeeScreenState createState() => NewEmployeeScreenState();
}

class NewEmployeeScreenState extends State<NewEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EmployeeViewModel>();
    return AlertWrapper<EmployeeViewModel>(
        viewModel: viewModel,
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add employee"),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    TextField(
                      controller: viewModel.employeeController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                      ),
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder(
                      future: viewModel.fetchLocations(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Location',
                            ),
                            value: viewModel.selectedLocation?.name,
                            onChanged: (String? newValue) {
                              viewModel.setLocation(newValue!);
                            },
                            items: snapshot.data!
                                .map<DropdownMenuItem<String>>((location) {
                              return DropdownMenuItem<String>(
                                value: location,
                                child: Text(location),
                              );
                            }).toList(),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    () {
                      if (viewModel.canSelectCategory) {
                        return FutureBuilder(
                          future: viewModel
                              .fetchCategories(viewModel.selectedLocation!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Category',
                                ),
                                value: viewModel.selectedCategory?.name,
                                onChanged: (String? newValue) {
                                  viewModel.setCategory(newValue!);
                                },
                                items: snapshot.data!
                                    .map<DropdownMenuItem<String>>((category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  );
                                }).toList(),
                              );
                            } else {
                              return const SizedBox(height: 60);
                            }
                          },
                        );
                      } else {
                        return const SizedBox(height: 60);
                      }
                    }(),
                    const SizedBox(height: 20),
                    () {
                      if (viewModel.isAllSelected) {
                        return SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<EmployeeViewModel>().addEmployee(
                                  viewModel.employeeController.text,
                                  viewModel.selectedLocation,
                                  viewModel.selectedCategory).then((_) => Navigator.of(context).pop());
                            },
                            child: const Text("Save"),
                          ),
                        );
                      } else {
                        return const SizedBox(height: 60);
                      }
                    }(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
