import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/location/new_location.dart';
import 'package:sequence_manager/screens/manager/add_manager.dart';
import 'package:sequence_manager/screens/user/user_getNumber.dart';
import 'package:sequence_manager/screens/user/user_wainting.dart';
import 'screens/employee/edit_employee.dart';
import 'notifiers.dart';

import 'screens/employee/new_employee.dart';

void main() {
  runApp(
    MultiProvider(
        providers: providers,
        child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AddManagerScreen(),
        ),
      ),
    );
  }
}
