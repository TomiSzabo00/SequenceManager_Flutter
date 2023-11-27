import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../global/alert_wrapper.dart';
import '../moderator/moderator_viewmodel.dart';

class NewLocationScreen extends StatelessWidget {
  const NewLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ModeratorViewModel>();
    return AlertWrapper<ModeratorViewModel>(
      viewModel: viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add new location"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: viewModel.locationController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      viewModel
                          .createLocation(viewModel.locationController.text);
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
