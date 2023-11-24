import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category.dart';
import '../../models/location.dart';
import '../global/alert_wrapper.dart';
import 'category_viewmodel.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({Key? key,required this.location, required this.category})
      : super(key: key);
  final Location location;
  final Category category;

  @override
  EditCategoryScreenState createState() => EditCategoryScreenState();
}

class EditCategoryScreenState extends State<EditCategoryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit category"),
      ),
      body: AlertWrapper<CategoryViewModel>(
        viewModel: viewModel,
        builder: (context, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: viewModel.textController,
                  decoration: InputDecoration(
                    labelText: "New name of ${widget.category.name}",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    viewModel.updateCategoryName(widget.category);
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
