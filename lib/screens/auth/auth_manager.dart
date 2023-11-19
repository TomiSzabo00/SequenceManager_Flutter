import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/auth/auth_viewmodel.dart';
import 'package:sequence_manager/screens/auth/login_screen.dart';
import 'package:sequence_manager/screens/auth/register_screen.dart';
import 'package:sequence_manager/screens/employee/employee.dart';
import 'package:sequence_manager/screens/global/alert_wrapper.dart';
import 'package:sequence_manager/screens/admin/admin_menu.dart';
import 'package:sequence_manager/screens/moderator/moderator_menu.dart';
import 'package:sequence_manager/screens/user/user_getNumber.dart';

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
        child: AlertWrapper<AuthViewModel>(
          viewModel: viewModel,
          builder: (context, _) => StreamBuilder(
            stream: viewModel.listenToLoginState(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data!;
                switch (user.type) {
                  case UserType.admin:
                    return AdminMenu(user: viewModel.loggedInUser!);
                  case UserType.manager:
                    return ModeratorMenu(user: viewModel.loggedInUser!);
                  case UserType.user:
                    return const UserGetNumberScreen();
                  case UserType.worker:
                    return const WorkerScreen();
                }
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
      ),
    );
  }
}
