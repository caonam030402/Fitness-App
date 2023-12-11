import 'dart:convert';
import 'package:fitness_app/components/custom_dialog.dart';
import 'package:fitness_app/configs/app_config.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      Response res = await post(
        Uri.parse('${config.baseUrl}auth/signin'),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 201) {
        Map<String, dynamic> responseBody = json.decode(res.body);
        String accessToken = responseBody['data']['access_token'];
        String userId = responseBody['data']['user']['_id'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('x-auth-token', accessToken);
        await prefs.setString('user-id', userId);

        Navigator.of(context).pushReplacementNamed(AppRoutes.main);
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
              title: 'LOGIN FAILED',
              titleStyle: AppText.large.copyWith(fontWeight: FontWeight.w600),
              desc: err.toString(),
              illustration: AppIcons.ic_error);
        },
      );
    }
  }

  register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      Response res = await post(
        Uri.parse('${config.baseUrl}auth/signup'),
        body: jsonEncode(
          {"email": email, "password": password, "name": name},
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 201) {
        Map<String, dynamic> responseBody = json.decode(res.body);
        String accessToken = responseBody['data']['access_token'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('x-auth-token', accessToken);
        Navigator.of(context).pushReplacementNamed(AppRoutes.information);
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
              title: 'REGISTED FAILED',
              titleStyle: AppText.large.copyWith(fontWeight: FontWeight.w600),
              desc: err.toString(),
              illustration: AppIcons.ic_error);
        },
      );
    }
  }
}
