import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/auth/auth_viewmodel.dart';
import 'package:sequence_manager/screens/auth/login_screen.dart';
import 'package:sequence_manager/screens/auth/register_screen.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({Key? key}) : super(key: key);

  @override
  State<AuthManager> createState() => AuthManagerState();
}

class AuthManagerState extends State<AuthManager> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthViewModel>(context, listen: false).listenToLoginState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: viewModel.listenToLoginState(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text("User is logged in");
            } else {
              if (viewModel.isLogin) {
                return const LoginScreen();
              } else {
                return const Registercreen();
              }
            }
          },
        ),
      ),
    );
  }
}
