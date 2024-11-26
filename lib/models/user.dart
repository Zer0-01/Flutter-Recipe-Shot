class UserModel {
  final String name;
  final String email;

  UserModel({
    required this.name,
    required this.email,
  });

  // Factory constructor to create a User from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
