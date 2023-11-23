import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Warning extends StatelessWidget {
  const Warning({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.red.withOpacity(0.1),
              borderRadius: AppStyles.borderRadiusCard),
          padding: AppStyles.paddingCard,
          child: Row(
            children: [
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.white.withOpacity(0.5)),
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.ic_clock_and_calendar,
                      fit: BoxFit.scaleDown,
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reminder!',
                    style: AppText.small.copyWith(
                        fontWeight: FontWeight.w400, color: AppColors.red),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Next Photos Fall On July 08',
                    style: AppText.small.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 5,
            right: 5,
            child: Container(
              height: 50,
              width: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99))),
                  child: SvgPicture.asset(AppIcons.ic_close)),
            ))
      ],
    );
  }
}
