import 'package:flutter/material.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';

class AddManagerScreen extends StatelessWidget {
  const AddManagerScreen(
      {super.key, required this.company, required this.viewModel, required this.doneAction});
  final Company company;
  final AdminViewModel viewModel;
  final Function doneAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new manager"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: viewModel.emailController,
                decoration: InputDecoration(
                  labelText: "Add manager to ${company.name}",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  viewModel.addManager(company);
                  doneAction();
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
