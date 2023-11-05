import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth/auth_viewmodel.dart';
import 'screens/employee/new_employee.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: NewEmployeeScreen(),
        ),
      ),
    );
  }
}
