import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatingButton extends StatelessWidget {
  final String icon;
  const FloatingButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: AppColors.secondaryGradiant),
      child: SvgPicture.asset(
        icon,
        height: 20,
        color: AppColors.white,
      ),
    );
  }
}
