import 'package:flutter/material.dart';

class UserMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, User"),
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
                    // Handle button 2 press
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
                    // Handle button 3 press
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