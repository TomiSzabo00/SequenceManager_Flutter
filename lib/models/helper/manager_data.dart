class ManagerData {
  String name;
  String email;

  ManagerData({required this.name, required this.email});

  factory ManagerData.fromJson(Map<String, dynamic> json) {
    return ManagerData(
      name: json['moderatorName'] as String,
      email: json['moderatorEmail'] as String,
    );
  }
}
