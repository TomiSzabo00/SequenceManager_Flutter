import 'package:flutter/material.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/admin/companies_list.dart';
import 'package:sequence_manager/screens/admin/manage_users.dart';
import 'package:sequence_manager/screens/global/app_bar_with_name.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key, required this.user, this.onLogout});
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
                        builder: (context) => const CompaniesList(),
                      ),
                    );
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ManageUsersScreen(),
                      ),
                    );
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
