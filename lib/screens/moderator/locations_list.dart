import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/screens/global/alert_wrapper.dart';
import 'package:sequence_manager/screens/location/edit_location.dart';
import 'package:sequence_manager/screens/location/new_location.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';

import '../../models/list/location_list_item.dart';

import 'categories_list.dart';

class LocationsList extends StatefulWidget {
  const LocationsList({super.key});

  @override
  LocationsListState createState() => LocationsListState();
}

class LocationsListState extends State<LocationsList> {
  late Future<List<ListItem>> fetchLocations;

  @override
  void initState() {
    super.initState();
    fetchLocations = Provider.of<ModeratorViewModel>(context, listen: false)
        .fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ModeratorViewModel();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Locations"),
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
                      future: viewModel.fetchLocations(),
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
                                          builder: (context) => EditLocationScreen(
                                              location: (data[index] as LocationListItem).location),
                                        ),
                                      ).then((_) {
                                        setState(() {
                                          viewModel.reset();
                                          fetchLocations = Provider.of<ModeratorViewModel>(context, listen: false).fetchLocations();
                                        });
                                      });
                                    } else if (value == "delete") {
                                      viewModel.deleteLocation(
                                          (data[index] as LocationListItem)
                                              .location);
                                      setState(() {
                                        viewModel.reset();
                                        fetchLocations = Provider.of<ModeratorViewModel>(context, listen: false).fetchLocations();
                                      });
                                    } else if (value == "categories") {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CategoriesList(
                                              location: (data[index]
                                                      as LocationListItem)
                                                  .location),
                                        ),
                                      );
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
                                      const PopupMenuItem(
                                        value: "categories",
                                        child: Text("Edit categories"),
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
                            builder: (context) => NewLocationScreen()
                          ),
                        ).then((_) {
                          setState(() {
                            viewModel.reset();
                            fetchLocations = Provider.of<ModeratorViewModel>(context, listen: false).fetchLocations();
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
