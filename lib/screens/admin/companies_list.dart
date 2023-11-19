import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';

class CompaniesList extends StatefulWidget {
  const CompaniesList({Key? key}) : super(key: key);

  @override
  CompaniesListState createState() => CompaniesListState();
}

class CompaniesListState extends State<CompaniesList> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminViewModel>(context, listen: false).fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = AdminViewModel();
    return AddNewList(
      title: "Companies",
      viewModel: viewModel,
    );
  }
}
