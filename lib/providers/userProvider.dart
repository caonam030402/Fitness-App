import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/services/user_services.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserService userService = UserService();
  User? _user;

  User? get user => _user;

  getUser() async {
    try {
      User newUser = await userService.getUser();

      _user = newUser;

      // notifyListeners();
    } catch (error) {
      print("Lỗi khi lấy dữ liệu: $error");
    }
  }
}
