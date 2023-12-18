import 'package:fitness_app/pages/activityTracker/index.dart';
import 'package:fitness_app/pages/notification/index.dart';
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
import 'package:fitness_app/pages/workout/startWorkout/index.dart';
import 'package:fitness_app/pages/workout/workoutDetail/index.dart';
import 'package:fitness_app/pages/workout/workoutDetailInfo/index.dart';

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
    '/workout_tracker_detail': (context) => WorkupTrackerDetail(),
    '/workout_detail_more': (context) => WorkupDetailMore(),
    '/start_workout': (context) => StartWorkout(),
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
  static const workout_tracker_detail = '/workout_tracker_detail';
  static const camera = '/camera';
  static const comparison = '/comparison';
  static const result = '/result';
  static const workout_detail_more = '/workout_detail_more';
  static const start_workout = '/start_workout';
}
