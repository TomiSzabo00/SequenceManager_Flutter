import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/auth/auth_viewmodel.dart';

class Registercreen extends StatefulWidget {
  const Registercreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<Registercreen> createState() => RegistercreenState();
}

class RegistercreenState extends State<Registercreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            viewModel.setLogin(true);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: viewModel.nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Name',
                  errorText:
                      viewModel.isNameValid ? null : "Please enter a name",
                ),
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  viewModel.isNameValid = true;
                },
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
                  viewModel.isPasswordAgainValid = true;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: viewModel.passwordAgainController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  errorText: viewModel.isPasswordAgainValid
                      ? null
                      : "Passwords do not match",
                ),
                obscureText: true,
                onChanged: (value) {
                  viewModel.isPasswordAgainValid = true;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      viewModel.register();
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
