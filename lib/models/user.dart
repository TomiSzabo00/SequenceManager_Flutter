class User {
  final String name;
  final String email;
  UserType type;

  User({
    required this.name,
    required this.email,
    this.type = UserType.user,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      type: UserType.fromString(json["role"]),
    );
  }

  String get firstname {
    return name.split(" ")[0];
  }

  factory User.empty() {
    return User(name: "", email: "");
  }
}

enum UserType {
  user,
  worker,
  manager,
  admin;

  static UserType fromString(String type) {
    switch (type) {
      case "CUSTOMER":
        return UserType.user;
      case "EMPLOYEE":
        return UserType.worker;
      case "COMPANY_MODERATOR":
        return UserType.manager;
      case "ADMIN":
        return UserType.admin;
      default:
        return UserType.user;
    }
  }

  String get jsonName {
    switch (this) {
      case UserType.user:
        return "CUSTOMER";
      case UserType.worker:
        return "EMPLOYEE";
      case UserType.manager:
        return "COMPANY_MODERATOR";
      case UserType.admin:
        return "ADMIN";
      default:
        return "CUSTOMER";
    }
  }

  String get name {
    switch (this) {
      case UserType.user:
        return "Customer";
      case UserType.worker:
        return "Employee";
      case UserType.manager:
        return "Company manager";
      case UserType.admin:
        return "Admin";
      default:
        return "CUSTOMER";
    }
  }
}
