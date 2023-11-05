import 'package:flutter/material.dart';

class WorkerScreen extends StatelessWidget {
  final int calledNumber=100;
  final String place="T-com";

  const WorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Dolgozói képernyő"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Currently called number:"),
            Text(
              calledNumber.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            FractionallySizedBox(
              widthFactor: 0.5, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button 1 press
                  },
                  child: const Text("Következő"),
                ),
              ),
            ),
            const Text("Current place:"),
            Text(
              place,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}