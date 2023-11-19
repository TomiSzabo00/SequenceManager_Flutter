import 'package:flutter/material.dart';
import 'package:sequence_manager/models/user.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // Handle profile
            },
            child: Text(
              "Hello, ${user.firstname}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.75, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button 1 press
                  },
                  child: const Text("Companies"),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.75, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button 2 press
                  },
                  child: const Text("Manage users"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
