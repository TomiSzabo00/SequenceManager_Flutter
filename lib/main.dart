import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/auth/auth_manager.dart';
import 'notifiers.dart';

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
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AuthManager(),
        ),
      ),
    );
  }
}
