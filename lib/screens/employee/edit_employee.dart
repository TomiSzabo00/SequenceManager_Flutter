import 'package:flutter/material.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({super.key});

  @override
  _EditEmployeeScreenState createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  String? selectedOption1; // Initially selected option for the first dropdown
  String? selectedOption2; // Initially selected option for the second dropdown
  String name = '';

  List<String> options1 = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> options2 = ['Option A', 'Option B', 'Option C', 'Option D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New employee"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.75, // 75% of the screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                value: selectedOption1,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption1 = newValue;
                  });
                },
                items: options1.map<DropdownMenuItem<String>>((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                value: selectedOption2,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption2 = newValue;
                  });
                },
                items: options2.map<DropdownMenuItem<String>>((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the submit button press
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