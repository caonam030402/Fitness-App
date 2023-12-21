import 'package:fitness_app/pages/loginAndRegister/list_register_intro_page.dart';
import 'package:fitness_app/pages/loginAndRegister/login_page.dart';
import 'package:fitness_app/pages/loginAndRegister/personal_information_page.dart';
import 'package:fitness_app/pages/loginAndRegister/register_page.dart';
import 'package:fitness_app/pages/loginAndRegister/wellcome_page.dart';
import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/mealPlanner/breakfast/index.dart';
import 'package:fitness_app/pages/mealPlanner/mealDetails/index.dart';
import 'package:fitness_app/pages/mealPlanner/mealPlannerPage/index.dart';
import 'package:fitness_app/pages/onboarding/onboarding_page.dart';
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
    '/onboarding': (context) => OnboardingPage(),
    '/mealPlanner': (context) => MealPlannerPage(),
    '/mealDetails': (context) => MealDetails(),
    '/breakfast': (context) => Breakfast(),
  };
  static const login = '/login';
  static const breakfast = '/breakfast';
  static const mealDetails = '/mealDetails';
  static const register = '/register';
  static const main = '/main';
  static const intro = '/intro';
  static const wellcome = '/wellcome';
  static const information = '/information';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
}
