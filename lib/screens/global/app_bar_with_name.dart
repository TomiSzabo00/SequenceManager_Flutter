import 'package:flutter/material.dart';

class ScaffoldWithName extends StatelessWidget implements PreferredSizeWidget {
  const ScaffoldWithName({
    required this.name,
    this.body,
    this.onLogout,
    Key? key,
  }) : super(key: key);

  final String name;
  final Widget? body;
  final Function? onLogout;

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // Handle profile
            },
            child: Text(
              "Hello, $name",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sequence Manager',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                onLogout?.call();
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
