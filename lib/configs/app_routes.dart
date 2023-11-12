import 'package:fitness_app/pages/list_register_intro_page.dart';
import 'package:fitness_app/pages/login_page.dart';
import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/onboarding_page.dart';
import 'package:fitness_app/pages/personal_information_page.dart';
import 'package:fitness_app/pages/register_page.dart';
import 'package:fitness_app/pages/wellcome_page.dart';
import 'package:fitness_app/pages/splash_page.dart';

class AppRoutes {
  static final pages = {
    '/main': (context) => MainPage(),
    '/register': (context) => RegisterPage(),
    '/login': (context) => LoginPage(),
    '/intro': (context) => ListRegisterIntroPage(),
    '/wellcome': (context) => WellcomePage(),
    '/information': (context) => PersonalInformationPage(),
    '/splash': (context) => SplashPage(),
    '/onboarding': (context) => OnboardingPage()
  };
  static const login = '/login';
  static const register = '/register';
  static const main = '/main';
  static const intro = '/intro';
  static const wellcome = '/wellcome';
  static const information = '/information';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
}
