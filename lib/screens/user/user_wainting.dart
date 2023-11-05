import 'package:flutter/material.dart';

class UserWaitingScreen extends StatelessWidget {
  final int yourNumber=100;
  final int peopleAhead=1;
  final String place="T-com";

  const UserWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Sorban áll"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Your number:"),
            Text(
              yourNumber.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              peopleAhead == 1
                  ? "1 person is ahead of you"
                  : "$peopleAhead people are ahead of you",
              style: const TextStyle(fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Text(
              place,
              style: const TextStyle(fontSize: 16),
            ),
            FractionallySizedBox(
              widthFactor: 0.75, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button 1 press
                  },
                  child: const Text("Törlés"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}