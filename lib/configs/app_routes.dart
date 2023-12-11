import 'package:fitness_app/pages/dashboard/activityTracker/index.dart';
import 'package:fitness_app/pages/dashboard/notification/index.dart';
import 'package:fitness_app/pages/loginAndRegister/list_register_intro_page.dart';
import 'package:fitness_app/pages/loginAndRegister/login_page.dart';
import 'package:fitness_app/pages/loginAndRegister/personal_information_page.dart';
import 'package:fitness_app/pages/loginAndRegister/register_page.dart';
import 'package:fitness_app/pages/loginAndRegister/wellcome_page.dart';
import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/onboarding/onboarding_page.dart';
import 'package:fitness_app/pages/onboarding/splash_page.dart';
import 'package:fitness_app/pages/progressTracker/comparison/index.dart';
import 'package:fitness_app/pages/progressTracker/progressPhoto/index.dart';
import 'package:fitness_app/pages/progressTracker/result/index.dart';

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
    '/notification': (context) => Notification(),
    '/activity_tracker': (context) => ActivityTracker(),
    '/camera': (context) => ProgressPhotoPage(),
    '/comparison': (context) => ComparisonPage(),
    '/result': (context) => ResultPage(),
  };
  static const login = '/login';
  static const register = '/register';
  static const main = '/main';
  static const intro = '/intro';
  static const wellcome = '/wellcome';
  static const information = '/information';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const notification = '/notification';
  static const activity_tracker = '/activity_tracker';
  static const camera = '/camera';
  static const comparison = '/comparison';
  static const result = '/result';
}
