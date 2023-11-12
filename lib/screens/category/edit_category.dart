import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_category_viewmodel.dart';

class EditCategoryScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final String name='T-com';

  EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EditCategoryViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit category"),
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
                  labelText: "New name of ${viewModel.getName}",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  viewModel.setName(textController.text);
                  //TODO: Átirányítás
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