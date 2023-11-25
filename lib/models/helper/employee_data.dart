class EmployeeData {
  String employeeName;
  String employeeEmail;
  String employeeCompany;
  String employeeLocation;
  String employeeService;
  int? currentSequenceNumber;
  int queueCount;

  EmployeeData(
      {this.employeeName = "",
      this.employeeEmail = "",
      this.employeeCompany = "",
      this.employeeLocation = "",
      this.employeeService = "",
      this.currentSequenceNumber = 0,
      this.queueCount = 0});

  factory EmployeeData.fromJson(Map<String, dynamic> json) {
    return EmployeeData(
      employeeName: json['employeeName'],
      employeeEmail: json['employeeEmail'],
      employeeCompany: json['employeeCompany'],
      employeeLocation: json['employeeLocation'],
      employeeService: json['employeeService'],
      currentSequenceNumber: json['currentSequenceNumber'],
      queueCount: json['queueCount'],
    );
  }
}