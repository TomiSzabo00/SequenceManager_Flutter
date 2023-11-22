import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_employee_viewmodel.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({super.key});

  @override
  EditEmployeeScreenState createState() => EditEmployeeScreenState();
}

class EditEmployeeScreenState extends State<EditEmployeeScreen> {

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EditEmployeeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit employee"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.75, // 75% of the screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  viewModel.setName(value);
                },

              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                value: viewModel.getLocation,
                onChanged: (String? newValue) {
                  viewModel.setCategory(newValue);
                },
                items: viewModel.getLocations().map<DropdownMenuItem<String>>((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                value: viewModel.getCategory,
                onChanged: (String? newValue) {
                  viewModel.setCategory(newValue);
                },
                items: viewModel.getCategories().map<DropdownMenuItem<String>>((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  viewModel.save();
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}