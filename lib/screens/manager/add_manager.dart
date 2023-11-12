import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_manager_viewmodel.dart';

class AddManagerScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  AddManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddManagerViewModel>();
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
                controller: textController,
                decoration: InputDecoration(
                  labelText: "Add manager to ${viewModel.getPlace}",
                ),
                onChanged: (value) {
                  viewModel.setName(value);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  viewModel.save();
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