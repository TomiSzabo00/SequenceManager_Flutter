import 'package:flutter/material.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/moderator/categories_list.dart';
import 'package:sequence_manager/screens/moderator/employee_list.dart';
import 'package:sequence_manager/screens/moderator/locations_list.dart';

class ModeratorMenu extends StatelessWidget {
  const ModeratorMenu({super.key, required this.user});
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LocationsList(),
                      ),
                    );
                  },
                  child: const Text("Edit location"),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.75, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CategoriesList(),
                      ),
                    );
                  },
                  child: const Text("Edit categories"),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.75, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EmployeeList(),
                      ),
                    );
                  },
                  child: const Text("Edit employees"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
