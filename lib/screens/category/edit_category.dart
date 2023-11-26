import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/location.dart';

import '../../models/category.dart';
import '../global/alert_wrapper.dart';
import '../moderator/moderator_viewmodel.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({Key? key, required this.location, required this.category}) : super(key: key);

  final Category category;
  final Location location;

  @override
  EditCategoryScreenState createState() => EditCategoryScreenState();
}

class EditCategoryScreenState extends State<EditCategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ModeratorViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit category"),
      ),
      body: AlertWrapper<ModeratorViewModel>(
        viewModel: viewModel,
        builder: (context, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text("Name"),
                    subtitle: Text(widget.category.name),
                    trailing: IconButton(
                      onPressed: () {
                        showNameChangeDialog();
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ]
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
            controller: context.read<ModeratorViewModel>().categoryController,
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
                context.read<ModeratorViewModel>().updateCategory(widget.location, widget.category);
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
