import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/services/user_services.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  UserService userService = UserService();
  User? _user;

  User? get user => _user;

  setData() async {
    try {
      User newUser = await userService.getUser();

      if (_user != newUser) {
        _user = newUser;
        notifyListeners();
      }
    } catch (error) {
      print("Lỗi khi lấy dữ liệu: $error");
    }
  }
}
