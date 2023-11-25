import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/helper/employee_data.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

class EmployeeViewModel extends AlertViewModel {
  Future<EmployeeData?> fetchEmployeeData() async {
    try {
      return await API.instance.fetchEmployeeData();
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<EmployeeData?> callNext() async {
    try {
      return await API.instance.callNextCustomer();
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return null;
    }
  }
}
