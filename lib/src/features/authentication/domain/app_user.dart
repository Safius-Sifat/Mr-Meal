import 'dart:convert';

class AppUser {
  final String name;
  final String email;
  final String phone;
  final String token;

  AppUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
  });
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      token: map['token'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'token': token,
    };
  }

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(jsonDecode(source) as Map<String, dynamic>);
  @override
  String toString() =>
      'AppUser(name: $name, email: $email, phone: $phone, token: $token)';

  String toJson() => jsonEncode(toMap());
}
