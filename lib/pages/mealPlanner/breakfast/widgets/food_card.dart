import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodCard extends StatelessWidget {
  final String icon;
  final String title;
  final String label;
  final Color? color;
  const FoodCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.title,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 200,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppStyles.borderRadiusCard,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 78, child: SvgPicture.asset(icon)),
          Column(
            children: [
              Text(title,
                  style: AppText.medium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    height: 1.8,
                  )),
              Text(label,
                  style: AppText.small.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray_1,
                  )),
            ],
          ),
          Button(text: 'view', onPressed: () {}, size: Size.medium),
        ],
      ),
    );
  }
}
