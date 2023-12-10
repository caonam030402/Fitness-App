import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BreakfastCard extends StatelessWidget {
  final String content;
  final String title;
  final String label;
  final bool isColorSecondary;
  const BreakfastCard({
    super.key,
    required this.content,
    required this.title,
    required this.label,
    this.isColorSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: isColorSecondary == false
                      ? AppColors.primary.withOpacity(0.3)
                      : AppColors.secondary.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(100))),
              child: Padding(
                padding: AppStyles.paddingCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: AppText.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          height: 1.8),
                    ),
                    Text(
                      content,
                      style: AppText.small.copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.gray_1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Button(
                        text: label,
                        color: isColorSecondary == false
                            ? AppColors.primaryGradiant
                            : AppColors.secondaryGradiant,
                        size: Size.small,
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            Positioned(
                right: 10, top: 10, child: SvgPicture.asset(AppIcons.vt_cake))
          ],
        ),
      ],
    );
  }
}
