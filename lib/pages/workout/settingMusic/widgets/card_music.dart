import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardMusic extends StatelessWidget {
  const CardMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [AppShadows.shadowCard],
          borderRadius: AppStyles.borderRadiusCard,
          color: AppColors.white),
      padding: AppStyles.paddingCard,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step Highter',
                style: AppText.large.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '02:00',
                style: AppText.medium.copyWith(fontWeight: FontWeight.w300),
              )
            ],
          ),
          Spacer(),
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.gray_3),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                AppIcons.ic_pause,
                width: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
