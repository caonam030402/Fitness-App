import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/pages/onboarding/onboarding_page.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: SvgPicture.asset(AppIcons.ic_logo)),
      nextScreen: Auth.token == null ? OnboardingPage() : MainPage(),
      backgroundColor: AppColors.white,
    );
  }
}
