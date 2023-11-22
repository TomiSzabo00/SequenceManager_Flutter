import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/helper/manager_data.dart';
import 'package:sequence_manager/models/list/user_list_item.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';
import 'package:sequence_manager/screens/global/alert_wrapper.dart';
import 'package:sequence_manager/screens/admin/add_manager.dart';

class EditCompanyScreen extends StatefulWidget {
  const EditCompanyScreen({Key? key, required this.company}) : super(key: key);

  final Company company;

  @override
  EditCompanyScreenState createState() => EditCompanyScreenState();
}

class EditCompanyScreenState extends State<EditCompanyScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminViewModel>(context, listen: false)
        .fetchManagers(widget.company);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AdminViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Company"),
      ),
      body: AlertWrapper<AdminViewModel>(
        viewModel: viewModel,
        builder: (context, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text("Name"),
                  subtitle: Text(widget.company.name),
                  trailing: IconButton(
                    onPressed: () {
                      showNameChangeDialog();
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  contentPadding: const EdgeInsets.all(0),
                ),
                const SizedBox(height: 60),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Managers:", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<AdminViewModel>(context, listen: false)
                        .fetchManagers(widget.company),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final managers = snapshot.data as List<UserListItem>;
                        return ListView.builder(
                          itemCount: managers.length,
                          itemBuilder: (context, index) {
                            final manager = managers[index];
                            return ListTile(
                              title: Text(manager.title),
                              subtitle: Text(manager.subtitle),
                              trailing: IconButton(
                                onPressed: () {
                                  viewModel.deleteManager(
                                      widget.company,
                                      ManagerData(
                                          name: manager.user.name,
                                          email: manager.user.email));
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddManagerScreen(
                              company: widget.company,
                              viewModel: viewModel,
                              doneAction: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      );
                    },
                    child: const Text("Add new manager"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showNameChangeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Change name"),
          content: TextField(
            controller: context.read<AdminViewModel>().nameController,
            decoration: const InputDecoration(
              labelText: "New name",
              border: OutlineInputBorder(),
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
                context.read<AdminViewModel>().updateCompanyName(widget.company,
                    context.read<AdminViewModel>().nameController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Change"),
            ),
          ],
        );
      },
    );
  }
}
