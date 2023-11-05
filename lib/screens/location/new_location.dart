import 'package:flutter/material.dart';

class NewLocationScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final String name='T-com';

  NewLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  labelText: "New name of $name",
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
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}