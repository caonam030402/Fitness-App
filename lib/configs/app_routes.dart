import 'package:fitness_app/pages/login_page.dart';
import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/signup_page.dart';

class AppRoutes {
  static final pages = {
    '/main': (context) => MainPage(),
    '/signup': (context) => SignUpPage(),
    '/login': (context) => LoginPage(),
  };
  static const login = '/login';
  static const signup = '/signup';
  static const main = '/main';
  static const splash = 'splash';
}
