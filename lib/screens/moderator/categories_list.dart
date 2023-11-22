import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/location.dart';
import 'package:sequence_manager/screens/category/edit_category.dart';
import 'package:sequence_manager/screens/category/new_category.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key, required this.location}) : super(key: key);
  final Location location;

  @override
  CategoriesListState createState() => CategoriesListState();
}

class CategoriesListState extends State<CategoriesList> {
  late Future<List<ListItem>> fetchCategories;

  @override
  void initState() {
    super.initState();
    fetchCategories = Provider.of<ModeratorViewModel>(context, listen: false)
        .fetchCategories(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ModeratorViewModel>();
    return AddNewList(
      title: "Categories",
      fetchItems: fetchCategories,
      updateItem: (item) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EditCategoryScreen()),
        );
      },
      deleteItem: viewModel.deleteCategory,
      addNewItem: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NewCategoryScreen()),
        );
      },
    );
  }
}
