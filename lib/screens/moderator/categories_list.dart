import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  CategoriesListState createState() => CategoriesListState();
}

class CategoriesListState extends State<CategoriesList> {
  late Future<List<ListItem>> fetchCategories;

  @override
  void initState() {
    super.initState();
    fetchCategories = Provider.of<ModeratorViewModel>(context, listen: false)
        .fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ModeratorViewModel>();
    return AddNewList(
      title: "Categories",
      fetchItems: fetchCategories,
      updateItem: viewModel.editCategory,
      deleteItem: viewModel.deleteCategory,
      addNewItem: viewModel.addNewCategory,
    );
  }
}
