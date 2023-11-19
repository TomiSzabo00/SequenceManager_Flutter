import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/list/list_item.dart';

class CompanyListItem extends ListItem {
  CompanyListItem({
    required this.company,
  }) : super(title: company.name);

  final Company company;
}