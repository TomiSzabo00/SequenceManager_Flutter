import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';
import 'package:sequence_manager/screens/global/alert_wrapper.dart';

class NewCompanyScreen extends StatefulWidget {
  const NewCompanyScreen({Key? key, required this.doneAction})
      : super(key: key);
  final Function doneAction;

  @override
  NewCompanyScreenState createState() => NewCompanyScreenState();
}

class NewCompanyScreenState extends State<NewCompanyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AdminViewModel>(context, listen: false).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AdminViewModel>();
    return AlertWrapper<AdminViewModel>(
        viewModel: viewModel,
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add new company"),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      controller: viewModel.nameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Name',
                        errorText:
                            viewModel.isNameValid ? null : 'Name is required',
                      ),
                      onChanged: (value) => viewModel.validateName(),
                    ),
                    const SizedBox(height: 60),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Managers:", style: TextStyle(fontSize: 16)),
                    ),
                    Expanded(child: () {
                      if (viewModel.managers.isEmpty) {
                        return const Center(
                          child: Text("No managers added yet."),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: viewModel.managers.length,
                          itemBuilder: (context, index) {
                            final manager = viewModel.managers[index];
                            return ListTile(
                              title: Text(manager.title),
                              subtitle: Text(manager.subtitle),
                              trailing: IconButton(
                                onPressed: () {
                                  viewModel
                                      .removeManagerCreatingCompany(manager);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                            );
                          },
                        );
                      }
                    }()),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          showEmailAddDialog();
                        },
                        child: const Text("Add new manager"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          try {
                            viewModel.createCompany();
                            widget.doneAction();
                          } catch (e) {
                            if (kDebugMode) {
                              print(e);
                            }
                          }
                        },
                        child: const Text("Done"),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void showEmailAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add new manager"),
          content: TextField(
            controller: context.read<AdminViewModel>().emailController,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                try {
                  context.read<AdminViewModel>().addNewManagerCreatingCompany();
                } catch (e) {
                  return;
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
