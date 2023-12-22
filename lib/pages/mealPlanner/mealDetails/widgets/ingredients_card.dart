import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IngredientsCard extends StatelessWidget {
  final String label;
  final String text;
  final String icon;
  const IngredientsCard(
      {super.key, required this.label, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.border,
          ),
          child: SvgPicture.asset(icon),
        ),
        Text(label,
            style: AppText.small.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                height: 2)),
        Text(text,
            style: AppText.caption.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.gray_1,
                height: 1.5)),
      ],
    );
  }
}
