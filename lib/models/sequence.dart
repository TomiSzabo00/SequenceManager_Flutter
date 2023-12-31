class Sequence {
  int? sequence;
  int? queueUsersCount;
  int? queuePosition;
  String? location;
  String name;
  String email;
  String role;

  Sequence(
      {this.sequence = 0,
      this.queueUsersCount = 0,
      this.queuePosition = 0,
      this.location = "",
      this.name = "",
      this.email = "",
      this.role = ""});

  factory Sequence.fromJson(Map<String, dynamic> json) {
    return Sequence(
      sequence: json['sequence'],
      queueUsersCount: json['queueUsersCount'],
      queuePosition: json['queuePosition'],
      location: json['location'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}
