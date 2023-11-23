// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/user.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({Key? key}) : super(key: key);

  @override
  ManageUsersScreenState createState() => ManageUsersScreenState();
}

class ManageUsersScreenState extends State<ManageUsersScreen> {
  final TextEditingController _emailController = TextEditingController();
  UserType _category = UserType.worker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage users"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: _emailController.text.isEmpty
                      ? 'Email is required'
                      : null,
                ),
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 60),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Set role to:"),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Role',
                ),
                value: _category.toString(),
                onChanged: (String? newValue) {
                  setState(() {
                    _category = UserType.values.firstWhere(
                        (element) => element.toString() == newValue);
                  });
                },
                items: UserType.values
                    .map<DropdownMenuItem<String>>((UserType option) {
                  return DropdownMenuItem<String>(
                    value: option.toString(),
                    child: Text(option.name),
                  );
                }).toList(),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _emailController.text.isEmpty
                      ? null
                      : () async {
                          try {
                            await API.instance.updateUserRole(
                                _emailController.text, _category);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("User role updated"),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        },
                  child: const Text("Save"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
