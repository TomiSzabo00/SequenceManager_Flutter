import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/helper/employee_data.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/employee/employee_viewmodel.dart';
import 'package:sequence_manager/screens/global/alert_wrapper.dart';
import 'package:sequence_manager/screens/global/app_bar_with_name.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key, required this.user, this.onLogout});
  final User user;
  final Function? onLogout;

  @override
  WorkerScreenState createState() => WorkerScreenState();
}

class WorkerScreenState extends State<WorkerScreen> {
  late Future<EmployeeData?> fetchEmployeeData;

  @override
  void initState() {
    super.initState();
    fetchEmployeeData = Provider.of<EmployeeViewModel>(context, listen: false)
        .fetchEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EmployeeViewModel>();
    return AlertWrapper<EmployeeViewModel>(
        viewModel: viewModel,
        builder: (context, _) {
          return ScaffoldWithName(
            name: widget.user.firstname,
            onLogout: widget.onLogout,
            body: Center(
              child: FutureBuilder(
                  future: fetchEmployeeData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        (snapshot.data as EmployeeData).currentSequenceNumber !=
                            null) {
                      final data = snapshot.data as EmployeeData;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Currently called number:"),
                          Text(
                            data.currentSequenceNumber.toString(),
                            style: const TextStyle(fontSize: 50),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.5, // 75% of the screen width
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    fetchEmployeeData =
                                        Provider.of<EmployeeViewModel>(context,
                                                listen: false)
                                            .callNext();
                                  });
                                },
                                child: const Text("Call next number"),
                              ),
                            ),
                          ),
                          const Text("Current place:"),
                          Text(
                            "${data.employeeLocation} - ${data.employeeService}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          fetchEmployeeData = Provider.of<EmployeeViewModel>(
                                  context,
                                  listen: false)
                              .callNext();
                        });
                      },
                      child: const Text("Call a number"),
                    );
                  }),
            ),
          );
        });
  }
}
