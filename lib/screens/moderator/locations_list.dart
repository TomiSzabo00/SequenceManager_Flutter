import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';
import 'package:sequence_manager/screens/global/alert_wrapper.dart';
import 'package:sequence_manager/screens/location/edit_location.dart';
import 'package:sequence_manager/screens/location/new_location.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';

import '../../models/list/location_list_item.dart';

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
    return AlertWrapper<ModeratorViewModel>(
      viewModel: viewModel,
      builder: (_, __) => AddNewList(
        title: "Locations",
        fetchItems: fetchLocations,
        updateItem: (location) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditLocationScreen(
                location : (location as LocationListItem).location
              ),
            ),
          );
        },
        deleteItem: (location) {
          viewModel.deleteLocation((location as LocationListItem).location);
        },
        addNewItem: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewLocationScreen()),
          );
        },
      ),
    );
  }
}
