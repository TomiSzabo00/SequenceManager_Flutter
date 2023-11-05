import 'package:flutter/material.dart';

class AddManagerScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final String place='T-com';
  AddManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manager"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Add manager to $place",
                style: const TextStyle(fontSize: 16),
              ),
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Enter some text',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the submit button press here
                  String enteredText = textController.text;
                  print('You entered: $enteredText');
                  // You can process the entered text here
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