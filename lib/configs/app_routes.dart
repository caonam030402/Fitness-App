import 'package:fitness_app/pages/login_and_register/list_register_intro_page.dart';
import 'package:fitness_app/pages/login_and_register/login_page.dart';
import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/onboarding/onboarding_page.dart';
import 'package:fitness_app/pages/login_and_register/personal_information_page.dart';
import 'package:fitness_app/pages/login_and_register/register_page.dart';
import 'package:fitness_app/pages/login_and_register/wellcome_page.dart';
import 'package:fitness_app/pages/onboarding/splash_page.dart';

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
