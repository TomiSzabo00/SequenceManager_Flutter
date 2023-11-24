import '../category.dart';
import 'list_item.dart';

class CategoryListItem extends ListItem {
  CategoryListItem({
    required this.category,
  }) : super(title: category.name);

  final Category category;
}