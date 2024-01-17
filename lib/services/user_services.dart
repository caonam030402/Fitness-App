import 'dart:convert';
import 'package:fitness_app/configs/app_config.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  updateUser({
    required User body,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = await prefs.getString('user-id');

    Response res = await put(
      Uri.parse('${config.baseUrl}user/$userId'),
      body: jsonEncode(body.toMap()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.intro);
    }
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user-id');

    Response res = await get(
      Uri.parse('${config.baseUrl}user/$userId'),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(res.body)['data'] ?? {};
      User user = User.fromMap(jsonData);

      return user;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
