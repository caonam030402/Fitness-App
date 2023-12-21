import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  final String title;
  final String label;
  const TitleItem({super.key, required this.title, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 170,
          child: Text(
            title,
            style: AppText.large
                .copyWith(color: AppColors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          label,
          style: AppText.small
              .copyWith(color: AppColors.gray_1, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
