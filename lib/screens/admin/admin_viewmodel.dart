import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/list/company_list_item.dart';
import 'package:sequence_manager/models/list/list_item.dart';
import 'package:sequence_manager/models/list/user_list_item.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/global/list_viewmodel.dart';

class AdminViewModel extends ListViewModel {
  Future<List<CompanyListItem>> fetchCompanies() {
    final mockList = [
      CompanyListItem(company: Company(id: "0", name: "Comp 1")),
      CompanyListItem(company: Company(id: "1", name: "Comp 2")),
      CompanyListItem(company: Company(id: "2", name: "Comp 3")),
    ];
    return Future.value(mockList);
  }

  void addNewCompany() {}

  void deleteCompany(ListItem item) {}

  Future<List<UserListItem>> fetchManagers(Company company) {
    final mockList = [
      UserListItem(user: User(name: "User 1", email: "email1@test.com", type: UserType.manager)),
      UserListItem(user: User(name: "User 2", email: "email2@test.com", type: UserType.manager)),
    ];
    return Future.value(mockList);
  }
}
