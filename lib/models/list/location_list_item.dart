import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/location.dart';

class LocationListItem extends ListItem {
  LocationListItem({
    required this.location,
  }) : super(title: location.name);

  final Location location;
}