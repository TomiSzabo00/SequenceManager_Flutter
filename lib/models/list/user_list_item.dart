import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/user.dart';

class UserListItem extends ListItem {
  UserListItem({
    required this.user,
  }) : super(title: user.name, subtitle: user.email);

  final User user;
}