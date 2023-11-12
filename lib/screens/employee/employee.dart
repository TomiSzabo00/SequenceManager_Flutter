import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/employee/employee_viewmodel.dart';

class WorkerScreen extends StatelessWidget {

  const WorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EmployeeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title:const Text("Employee"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Currently called number:"),
            Text(
              viewModel.getCalledNumber.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            FractionallySizedBox(
              widthFactor: 0.5, // 75% of the screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.next();
                  },
                  child: const Text("Next"),
                ),
              ),
            ),
            const Text("Current place:"),
            Text(
              viewModel.getPlace,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}