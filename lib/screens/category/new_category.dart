import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/location.dart';
import '../global/alert_wrapper.dart';
import '../moderator/moderator_viewmodel.dart';

class NewCategoryScreen extends StatelessWidget {
  NewCategoryScreen({super.key, required this.location});

  Location location;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ModeratorViewModel>();
    return AlertWrapper<ModeratorViewModel>(
      viewModel: viewModel,
      builder: (context, _) {
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
                    controller: viewModel.categoryController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.createCategory(
                          location, viewModel.categoryController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
