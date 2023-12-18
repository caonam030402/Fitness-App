import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastActivityCard extends StatelessWidget {
  const LastActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Drinking 300ml Water',
                    style: AppText.medium.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'About 3 minutes ago',
                    style: AppText.small.copyWith(color: AppColors.gray_1),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          SvgPicture.asset(
            AppIcons.ic_more,
            width: 20,
          )
        ],
      ),
      padding: AppStyles.paddingCard,
      decoration: BoxDecoration(
          boxShadow: [AppShadows.shadowCard],
          color: AppColors.white,
          borderRadius: AppStyles.borderRadiusCard),
    );
  }
}
