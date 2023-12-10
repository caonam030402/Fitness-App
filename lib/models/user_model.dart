import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final double weight;
  final String password;
  final double height;
  final String token;
  final String gender;
  final String avatar;
  final DateTime date_of_birth;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.weight,
      required this.password,
      required this.height,
      required this.avatar,
      required this.date_of_birth,
      required this.gender,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "avatar": avatar,
      "date_of_birth": date_of_birth,
      "token": token,
      "gender": gender,
      "height": height,
      "weight": weight
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        avatar: map['avatar'] ?? '',
        date_of_birth: map['date_of_birth'] ?? '',
        token: map['token'] ?? '',
        gender: map['gender'] ?? '',
        height: map['height'] ?? '',
        weight: map['weight'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
