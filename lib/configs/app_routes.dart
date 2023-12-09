import 'package:fitness_app/pages/loginAndRegister/list_register_intro_page.dart';
import 'package:fitness_app/pages/loginAndRegister/login_page.dart';
import 'package:fitness_app/pages/loginAndRegister/personal_information_page.dart';
import 'package:fitness_app/pages/loginAndRegister/register_page.dart';
import 'package:fitness_app/pages/loginAndRegister/wellcome_page.dart';
import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/onboarding/onboarding_page.dart';
import 'package:fitness_app/pages/onboarding/splash_page.dart';
import 'package:fitness_app/pages/sleepTracker/addAlarm/index.dart';
import 'package:fitness_app/pages/sleepTracker/sleepSchedule/index.dart';
import 'package:fitness_app/pages/sleepTracker/sleepTrackerPage/index.dart';

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
    '/sleepSchedule': (context) => SleepSchedulePage(),
    '/addAlarm': (context) => AddAlarmPage(),
    '/sleep': (context) => SleepTrackerPage()
  };
  static const login = '/login';
  static const sleepSchedule = '/sleepSchedule';
  static const addAlarm = '/addAlarm';
  static const sleep = '/sleep';
  static const register = '/register';
  static const main = '/main';
  static const intro = '/intro';
  static const wellcome = '/wellcome';
  static const information = '/information';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
}
