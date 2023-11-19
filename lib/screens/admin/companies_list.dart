import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list_item.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';

class CompaniesList extends StatefulWidget {
  const CompaniesList({Key? key}) : super(key: key);

  @override
  CompaniesListState createState() => CompaniesListState();
}

class CompaniesListState extends State<CompaniesList> {
  late Future<List<ListItem>> fetchCompanies;
  
  @override
  void initState() {
    super.initState();
    fetchCompanies = Provider.of<AdminViewModel>(context, listen: false).fetchCompanies();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = AdminViewModel();
    return AddNewList(
      title: "Companies",
      fetchItems: fetchCompanies,
      updateItem: viewModel.editCompany,
      deleteItem: viewModel.deleteCompany,
    );
  }
}
