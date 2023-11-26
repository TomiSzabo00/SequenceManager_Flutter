import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';
import 'package:sequence_manager/screens/auth/auth_viewmodel.dart';
import 'package:sequence_manager/screens/employee/employee_viewmodel.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';
import 'package:sequence_manager/screens/user/user_viewmodel.dart';

var providers = [
  ChangeNotifierProvider<EmployeeViewModel>(create: (_) => EmployeeViewModel()),
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<AdminViewModel>(create: (_) => AdminViewModel()),
  ChangeNotifierProvider<ModeratorViewModel>(
      create: (_) => ModeratorViewModel()),
  ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
];
