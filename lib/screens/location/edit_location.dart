import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/location/edit_location_viewmodel.dart';

class EditLocationScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  EditLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EditLocationViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit location"),
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
                  labelText: "New location instead of ${viewModel.getName}",
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
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}