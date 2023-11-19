import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list_item.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';

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
    fetchLocations = Provider.of<ModeratorViewModel>(context, listen: false).fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ModeratorViewModel();
    return AddNewList(
      title: "Locations",
      fetchItems: fetchLocations,
      updateItem: viewModel.editLocation,
      deleteItem: viewModel.deleteLocation,
    );
  }
}