import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_category_viewmodel.dart';

class NewCategoryScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final String name="";

  NewCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewCategoryViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new category"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Category name",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  viewModel.setName(textController.text);
                  //TODO: redirect
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