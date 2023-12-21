import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/utils/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Auth auth = Auth();
  final token = await auth.getTokenFromSP();
  Auth.token = token;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitnessApp',
      theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: AppColors.white,
          brightness: Brightness.light),
      routes: AppRoutes.pages,
      initialRoute: AppRoutes.splash,
    );
  }
}
