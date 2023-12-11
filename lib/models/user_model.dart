import 'dart:convert';

class User {
  final String? id;
  final String? name;
  final String? email;
  final double? weight;
  final String? password;
  final double? height;
  final String? token;
  final String? gender;
  final String? avatar;
  final DateTime? date_of_birth;

  User(
      {this.id,
      this.name,
      this.email,
      this.weight,
      this.password,
      this.height,
      this.avatar,
      this.date_of_birth,
      this.gender,
      this.token});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
      "height": height,
      "weight": weight,
      "avatar": avatar,
      "date_of_birth": date_of_birth,
      "gender": gender,
    };

    map.removeWhere((key, value) => value == null);

    return map;
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
