class Category {
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['service'] as String,
    );
  }

  factory Category.fromString(String? name) {
    return Category(name: name ?? "");
  }
}