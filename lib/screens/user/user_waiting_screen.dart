import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/sequence.dart';
import 'package:sequence_manager/screens/user/user_viewmodel.dart';

class UserWaitingScreen extends StatelessWidget {
  const UserWaitingScreen({super.key, required this.sequence});
  final Sequence sequence;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stand in line"),
        leading: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Your number:"),
            Text(
              sequence.sequence.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              (sequence.queueUsersCount ?? 0) <= 1
                  ? "Go to the counter"
                  : "${(sequence.queueUsersCount ?? 0) - 1} people are ahead of you",
              style: const TextStyle(fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Text(
              sequence.location ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            FractionallySizedBox(
              widthFactor: 0.75, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.deleteNumber();
                  },
                  child: const Text("Delete"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
