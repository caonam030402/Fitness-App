import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/splash_page.dart';

class AppRoutes {
  static final pages = {
    '/main': (context) => MainPage(),
    '/splash': (context) => SplashPage()
  };
  static const login = '/login';
  static const register = '/register';
  static const main = '/main';
  static const splash = '/splash';
}
