import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/admin/admin_viewmodel.dart';
import 'package:sequence_manager/screens/auth/auth_viewmodel.dart';

import 'package:sequence_manager/screens/category/edit_category_viewmodel.dart';
import 'package:sequence_manager/screens/category/new_category_viewmodel.dart';
import 'package:sequence_manager/screens/employee/edit_employee_viewmodel.dart';
import 'package:sequence_manager/screens/employee/employee_viewmodel.dart';
import 'package:sequence_manager/screens/employee/new_employee_viewmodel.dart';
import 'package:sequence_manager/screens/location/edit_location_viewmodel.dart';
import 'package:sequence_manager/screens/location/new_location_viewmodel.dart';
import 'package:sequence_manager/screens/manager/add_manager_viewmodel.dart';
import 'package:sequence_manager/screens/moderator/moderator_viewmodel.dart';
import 'package:sequence_manager/screens/user/user_getNumber_viewmodel.dart';
import 'package:sequence_manager/screens/user/user_waiting_viewmodel.dart';

var providers = [
  ChangeNotifierProvider<EditCategoryViewModel>(create: (_) => EditCategoryViewModel()),
  ChangeNotifierProvider<NewCategoryViewModel>(create: (_) => NewCategoryViewModel()),
  ChangeNotifierProvider<EditEmployeeViewModel>(create: (_) => EditEmployeeViewModel()),
  ChangeNotifierProvider<EmployeeViewModel>(create: (_) => EmployeeViewModel()),
  ChangeNotifierProvider<NewEmployeeViewModel>(create: (_) => NewEmployeeViewModel()),
  ChangeNotifierProvider<EditLocationViewModel>(create: (_) => EditLocationViewModel()),
  ChangeNotifierProvider<NewLocationViewModel>(create: (_) => NewLocationViewModel()),
  ChangeNotifierProvider<AddManagerViewModel>(create: (_) => AddManagerViewModel()),
  ChangeNotifierProvider<UserGetNumberViewModel>(create: (_) => UserGetNumberViewModel()),
  ChangeNotifierProvider<UserWaitingViewModel>(create: (_) => UserWaitingViewModel()),
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<AdminViewModel>(create: (_) => AdminViewModel()),
  ChangeNotifierProvider<ModeratorViewModel>(create: (_) => ModeratorViewModel()),
  ];