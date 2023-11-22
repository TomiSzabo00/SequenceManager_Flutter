class Company {
  String name;

  Company({
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Company(name: "");
    }
    return Company(
      name: json['name'],
    );
  }

  factory Company.fromString(String? name) {
    return Company(name: name ?? "");
  }
}
