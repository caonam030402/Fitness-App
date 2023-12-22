import 'dart:convert';

import 'package:fitness_app/models/workout_model.dart';

class User {
  final String? id;
  final String? name;
  final String? email;
  final int? weight;
  final String? password;
  final int? height;
  final String? avatar;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? token;
  final List<WorkoutProgress>? workouts;

  User({
    this.id,
    this.name,
    this.email,
    this.weight,
    this.password,
    this.height,
    this.avatar,
    this.dateOfBirth,
    this.gender,
    this.token,
    this.workouts,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
      "height": height,
      "weight": weight,
      "avatar": avatar,
      "date_of_birth": dateOfBirth,
      "gender": gender,
      "workouts": workouts?.map((w) => w.toMap()).toList(),
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
      dateOfBirth: map['date_of_birth'] != null
          ? DateTime.parse(map['date_of_birth'])
          : null,
      token: map['token'] ?? '',
      gender: map['gender'] ?? '',
      height: map['height'] ?? 0,
      weight: map['weight'] ?? 0,
      workouts: (map['workouts'] as List<dynamic>?)
          ?.map((workout) => WorkoutProgress.fromMap(workout))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
