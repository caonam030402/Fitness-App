import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerSleep extends StatelessWidget {
  const BannerSleep({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 148,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.8),
              borderRadius: AppStyles.borderRadiusCard),
          child: Padding(
            padding: AppStyles.paddingCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last Night Sleep',
                  style: AppText.medium.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.white),
                ),
                Text(
                  '8h 20m',
                  style: AppText.medium.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: -10,
            child: SvgPicture.asset(AppIcons.vt_sleep_graph,
                width: MediaQuery.of(context).size.width))
      ],
    );
  }
}
