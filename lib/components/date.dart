import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  final String label;
  final bool isDateNow;
  final String date;
  const Date(
      {super.key,
      required this.label,
      required this.date,
      this.isDateNow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 60,
        decoration: isDateNow == false
            ? BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(10),
              )
            : BoxDecoration(
                gradient: AppColors.primaryGradiant,
                borderRadius: BorderRadius.circular(10),
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              label,
              style: isDateNow == false
                  ? AppText.small.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.gray_1)
                  : AppText.small.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.white),
            ),
            Text(
              date,
              style: isDateNow == false
                  ? AppText.medium.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.gray_1)
                  : AppText.small.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.white),
            ),
          ],
        ));
  }
}
