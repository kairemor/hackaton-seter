class User {
  late final String id;
  late final String username;
  late final String email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  User.empty();

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }
}
