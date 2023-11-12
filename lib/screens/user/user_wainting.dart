import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/user/user_waiting_viewmodel.dart';

class UserWaitingScreen extends StatelessWidget {

  const UserWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserWaitingViewModel>();
    return Scaffold(
      appBar: AppBar(
        title:const Text("Stand in line"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Your number:"),
            Text(
              viewModel.getNumber.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              viewModel.getPeopleAhead <= 0
                  ? "Go to the counter"
                  : "${viewModel.getPeopleAhead} people are ahead of you",
              style: const TextStyle(fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Text(
              viewModel.getPlace,
              style: const TextStyle(fontSize: 16),
            ),
            FractionallySizedBox(
              widthFactor: 0.75, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.delete();
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