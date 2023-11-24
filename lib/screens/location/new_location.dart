import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../moderator/moderator_viewmodel.dart';

class NewLocationScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  NewLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ModeratorViewModel>();
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
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Name of new location",

                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

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