import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/global/alert_wrapper.dart';
import 'package:sequence_manager/screens/global/app_bar_with_name.dart';
import 'package:sequence_manager/screens/user/user_viewmodel.dart';
import 'package:sequence_manager/screens/user/user_waiting_screen.dart';

class UserGetNumberScreen extends StatefulWidget {
  const UserGetNumberScreen({super.key, required this.user, this.onLogout});
  final User user;
  final Function? onLogout;

  @override
  UserGetNumberScreenState createState() => UserGetNumberScreenState();
}

class UserGetNumberScreenState extends State<UserGetNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>();
    return AlertWrapper<UserViewModel>(
        viewModel: viewModel,
        builder: (context, _) {
          return ScaffoldWithName(
            name: widget.user.firstname,
            onLogout: widget.onLogout,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Select where you want to get a number from:"),
                    const SizedBox(height: 60),
                    FutureBuilder(
                      future: viewModel.fetchCompanies(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Company',
                            ),
                            value: viewModel.selectedCompany?.name,
                            onChanged: (String? newValue) {
                              viewModel.setCompany(newValue!);
                            },
                            items: snapshot.data!
                                .map<DropdownMenuItem<String>>((company) {
                              return DropdownMenuItem<String>(
                                value: company,
                                child: Text(company),
                              );
                            }).toList(),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    () {
                      if (viewModel.canSelectLocation) {
                        return FutureBuilder(
                          future: viewModel
                              .fetchLocations(viewModel.selectedCompany!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Location',
                                ),
                                value: viewModel.selectedLocation?.name,
                                onChanged: (String? newValue) {
                                  viewModel.setLocation(newValue!);
                                },
                                items: snapshot.data!
                                    .map<DropdownMenuItem<String>>((location) {
                                  return DropdownMenuItem<String>(
                                    value: location,
                                    child: Text(location),
                                  );
                                }).toList(),
                              );
                            } else {
                              return const SizedBox(height: 60);
                            }
                          },
                        );
                      } else {
                        return const SizedBox(height: 60);
                      }
                    }(),
                    const SizedBox(height: 20),
                    () {
                      if (viewModel.canSelectCategory) {
                        return FutureBuilder(
                          future: viewModel.fetchCategories(
                              viewModel.selectedCompany!,
                              viewModel.selectedLocation!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Category',
                                ),
                                value: viewModel.selectedCategory?.name,
                                onChanged: (String? newValue) {
                                  viewModel.setCategory(newValue!);
                                },
                                items: snapshot.data!
                                    .map<DropdownMenuItem<String>>((category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  );
                                }).toList(),
                              );
                            } else {
                              return const SizedBox(height: 60);
                            }
                          },
                        );
                      } else {
                        return const SizedBox(height: 60);
                      }
                    }(),
                    const SizedBox(height: 20),
                    () {
                      if (viewModel.isAllSelected) {
                        return SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                final sequence = await viewModel.getNumber();
                                viewModel.reset();
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => UserWaitingScreen(
                                          sequence: sequence)),
                                );
                              } catch (e) {
                                return;
                              }
                            },
                            child: const Text("Get number"),
                          ),
                        );
                      } else {
                        return const SizedBox(height: 60);
                      }
                    }(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
