import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/global/app_bar_with_name.dart';
import 'package:sequence_manager/screens/user/user_get_number_viewmodel.dart';

class UserGetNumberScreen extends StatefulWidget {
  const UserGetNumberScreen({super.key, required this.user});
  final User user;

  @override
  UserGetNumberScreenState createState() => UserGetNumberScreenState();
}

class UserGetNumberScreenState extends State<UserGetNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserGetNumberViewModel>();
    return ScaffoldWithName(
      name: widget.user.firstname,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.75, // 75% of the screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                value: viewModel.getPlace,
                onChanged: (String? newValue) {
                  viewModel.setPlace(newValue);
                },
                items: viewModel
                    .getPlaces()
                    .map<DropdownMenuItem<String>>((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                value: viewModel.getCategory,
                onChanged: (String? newValue) {
                  viewModel.setCategory(newValue);
                },
                items: viewModel
                    .getCategories()
                    .map<DropdownMenuItem<String>>((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 1.0, // Occupy full available width
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.getNumber();
                  },
                  child: const Text("Stand into line"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
