import 'package:fitness_app/pages/main_page.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final VoidCallback onPressed;
  final Menus index;
  final Menus name;
  final String icon;
  final String iconActive;

  const BottomNavigationItem(
      {super.key,
      required this.onPressed,
      required this.index,
      required this.name,
      required this.icon,
      required this.iconActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        index == name ? iconActive : icon,
        colorFilter: ColorFilter.mode(
            index == name ? AppColors.secondary : AppColors.gray_2,
            BlendMode.srcIn),
      ),
    ));
  }
}
