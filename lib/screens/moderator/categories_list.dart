import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/list/category_list_item.dart';
import '../../models/list/list_item.dart';
import '../../models/location.dart';
import '../category/edit_category.dart';
import '../category/new_category.dart';
import '../global/alert_wrapper.dart';

import 'moderator_viewmodel.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key, required this.location});

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
    final viewModel = ModeratorViewModel();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        body: AlertWrapper<ModeratorViewModel>(
          viewModel: viewModel,
          builder: (_, __) => Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: viewModel.fetchCategories(widget.location),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!;
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(data[index].title),
                                subtitle: data[index].subtitle.isEmpty
                                    ? null
                                    : Text(data[index].subtitle),
                                trailing: PopupMenuButton(
                                  onSelected: (value) {
                                    if (value == "update") {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => EditCategoryScreen(
                                              location: widget.location,
                                              category: (data[index] as CategoryListItem).category),
                                        ),
                                      ).then((_) {
                                        setState(() {
                                          viewModel.reset();
                                          fetchCategories = Provider.of<ModeratorViewModel>(context, listen: false).fetchCategories(widget.location);
                                        });
                                      });
                                    } else if (value == "delete") {
                                      viewModel.deleteCategory(
                                          widget.location, (data[index] as CategoryListItem).category
                                      );
                                      setState(() {
                                        viewModel.reset();
                                        fetchCategories = Provider.of<ModeratorViewModel>(context, listen: false).fetchCategories(widget.location);
                                      });
                                    }
                                  },
                                  itemBuilder: (context) {
                                    return [
                                      const PopupMenuItem(
                                        value: "update",
                                        child: Text("Edit"),
                                      ),
                                      const PopupMenuItem(
                                        value: "delete",
                                        child: Text("Delete"),
                                      ),
                                    ];
                                  },
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NewCategoryScreen(
                                location: widget.location,
                                ),
                          ),
                        ).then((_) {
                          setState(() {
                            viewModel.reset();
                            fetchCategories = Provider.of<ModeratorViewModel>(context, listen: false).fetchCategories(widget.location);
                          });
                        });
                      },
                      child: const Text(
                        "Add new",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        )
    );
  }
}