import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/location.dart';

import '../global/alert_wrapper.dart';
import '../moderator/moderator_viewmodel.dart';

class EditLocationScreen extends StatefulWidget {
  const EditLocationScreen({Key? key, required this.location})
      : super(key: key);

  final Location location;

  @override
  EditLocationScreenState createState() => EditLocationScreenState();
}

class EditLocationScreenState extends State<EditLocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    context.read<ModeratorViewModel>().reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ModeratorViewModel>(context);
    return AlertWrapper<ModeratorViewModel>(
      viewModel: viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Edit location"),
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
                        subtitle: Text(widget.location.name),
                        trailing: IconButton(
                          onPressed: () {
                            showNameChangeDialog();
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }

  void showNameChangeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Change name"),
          content: TextField(
            controller: context.read<ModeratorViewModel>().locationController,
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
                context
                    .read<ModeratorViewModel>()
                    .updateLocation(widget.location);
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
