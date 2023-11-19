import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/list/company_list_item.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';
import 'package:sequence_manager/screens/global/add_new_list.dart';
import 'package:sequence_manager/screens/admin/edit_company.dart';
import 'package:sequence_manager/screens/admin/new_company.dart';

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
    fetchCompanies =
        Provider.of<AdminViewModel>(context, listen: false).fetchCompanies();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = AdminViewModel();
    return AddNewList(
      title: "Companies",
      fetchItems: fetchCompanies,
      updateItem: (company) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditCompanyScreen(
                company: (company as CompanyListItem).company),
          ),
        );
      },
      deleteItem: viewModel.deleteCompany,
      addNewItem: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NewCompanyScreen(),
          ),
        );
      },
    );
  }
}
