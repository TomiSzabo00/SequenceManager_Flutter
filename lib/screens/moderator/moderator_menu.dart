import 'package:flutter/material.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/global/app_bar_with_name.dart';
import 'package:sequence_manager/screens/moderator/employee_list.dart';
import 'package:sequence_manager/screens/moderator/locations_list.dart';

class ModeratorMenu extends StatelessWidget {
  const ModeratorMenu({super.key, required this.user, this.onLogout});
  final User user;
  final Function? onLogout;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithName(
      name: user.firstname,
      onLogout: onLogout,
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
                        builder: (context) => const EmployeesList(),
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
