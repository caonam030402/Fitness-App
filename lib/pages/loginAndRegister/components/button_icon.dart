import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(width: 0.8, color: AppColors.gray_3)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.white,
                shadowColor: Colors.transparent,
                elevation: 0),
            child: SvgPicture.asset(AppIcons.ic_google),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(width: 0.8, color: AppColors.gray_3)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.white,
                shadowColor: Colors.transparent,
                elevation: 0),
            child: SvgPicture.asset(AppIcons.ic_facebook),
          ),
        ),
      ],
    );
  }
}
