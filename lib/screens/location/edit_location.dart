import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/location.dart';
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
    Provider.of<ModeratorViewModel>(context, listen: false);
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: viewModel.locationController,
                  decoration: InputDecoration(
                    labelText: "New",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    viewModel.updateLocation(widget.location);
                    //TODO: Átirányítás
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}