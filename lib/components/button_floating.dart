import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonFloating extends StatelessWidget {
  final void Function()? onPressed;
  final dynamic icon;
  const ButtonFloating({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: AppColors.secondaryGradiant),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99))),
        onPressed: onPressed,
        child: Center(
          child: SvgPicture.asset(
            icon,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
