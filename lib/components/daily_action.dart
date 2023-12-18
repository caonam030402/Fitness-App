import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class DailyAction extends StatelessWidget {
  final String title;
  final String textAction;
  final Function()? onPressed;
  const DailyAction(
      {super.key,
      required this.title,
      required this.textAction,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppStyles.borderRadiusCard,
        color: AppColors.primary.withOpacity(0.3),
      ),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: AppText.medium.copyWith(fontWeight: FontWeight.w600)),
        Button(
          text: textAction,
          onPressed: onPressed,
          size: Size.small,
        )
      ]),
    );
  }
}
