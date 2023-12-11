import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  final String title;
  final String desc;
  const PersonalCard({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Column(children: [
        Text(
          title,
          style: AppText.medium
              .copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          desc,
          style: AppText.small.copyWith(color: AppColors.gray_1),
        ),
      ]),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: AppStyles.borderRadiusCard,
          color: AppColors.white,
          boxShadow: [AppShadows.shadowCard]),
    ));
  }
}
