import 'package:flutter/material.dart';

class UserGetNumberScreen extends StatefulWidget {
  const UserGetNumberScreen({super.key});

  @override
  _UserGetNumberScreenState createState() => _UserGetNumberScreenState();
}

class _UserGetNumberScreenState extends State<UserGetNumberScreen> {
  String? selectedOption1; // Initially selected option for the first dropdown
  String? selectedOption2; // Initially selected option for the second dropdown

  List<String> options1 = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> options2 = ['Option A', 'Option B', 'Option C', 'Option D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sorszám kérés"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.75, // 75% of the screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 1.0, // Occupy full available width
                child: DropdownButton<String>(
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
              ),
              const SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 1.0, // Occupy full available width
                child: DropdownButton<String>(
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
              ),
              const SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 1.0, // Occupy full available width
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the submit button press
                  },
                  child: Text("Sorszám kérése"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}