import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/auth/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset("lib/assets/logo.jpg"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: viewModel.emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: viewModel.isEmailValid
                      ? null
                      : "Please enter a valid email",
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  viewModel.isEmailValid = true;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: viewModel.passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  errorText: viewModel.isPasswordValid
                      ? null
                      : "Please enter a password",
                ),
                obscureText: true,
                onChanged: (value) {
                  viewModel.isPasswordValid = true;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      viewModel.login();
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      viewModel.setLogin(false);
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
