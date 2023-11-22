class Company {
  final String name;

  Company({
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
    );
  }
}
