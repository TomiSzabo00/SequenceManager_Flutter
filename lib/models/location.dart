class Location {
  String name;

  Location({required this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
    );
  }

  factory Location.fromString(String? name) {
    return Location(name: name ?? "");
  }
}
