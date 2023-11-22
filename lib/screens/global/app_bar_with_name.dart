import 'package:flutter/material.dart';

class AppBarWithName extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithName({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // Handle menu
        },
      ),
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
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50);
}
