import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/category.dart';
import 'package:sequence_manager/models/company.dart';
import 'package:sequence_manager/models/location.dart';
import 'package:sequence_manager/models/sequence.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

class UserViewModel extends AlertViewModel {
  Company? selectedCompany;
  Location? selectedLocation;
  Category? selectedCategory;

  bool get canSelectLocation => selectedCompany != null;
  bool get canSelectCategory =>
      selectedLocation != null && selectedCompany != null;
  bool get isAllSelected =>
      selectedCompany != null &&
      selectedLocation != null &&
      selectedCategory != null;

  Future<List<String>> fetchCompanies() async {
    try {
      return API.instance.getCompaniesForUser().then((value) {
        return value.map((e) => e.name).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  Future<List<String>> fetchLocations(Company company) async {
    try {
      return API.instance.getLocationsForCompanyForUser(company).then((value) {
        return value.map((e) => e.name).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  Future<List<String>> fetchCategories(
      Company company, Location location) async {
    try {
      return API.instance
          .getCategoriesForLocationForUser(company, location)
          .then((value) {
        return value.map((e) => e.name).toList();
      });
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      return [];
    }
  }

  void setCompany(String? value) {
    selectedCompany = Company(name: value ?? "");
    selectedLocation = null;
    selectedCategory = null;
    notifyListeners();
  }

  void setLocation(String? value) {
    selectedLocation = Location(name: value ?? "");
    selectedCategory = null;
    notifyListeners();
  }

  void setCategory(String? value) {
    selectedCategory = Category(name: value ?? "");
    notifyListeners();
  }

  void reset() {
    selectedCompany = null;
    selectedLocation = null;
    selectedCategory = null;
    notifyListeners();
  }

  Future<Sequence> getNumber() async {
    try {
      return await API.instance.getSequenceForUser(
          selectedCompany!, selectedLocation!, selectedCategory!);
    } catch (e) {
      alertMessage = e.toString();
      notifyListeners();
      rethrow;
    }
  }
}
