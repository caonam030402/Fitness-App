import 'package:fitness_app/components/bar_indicator.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NutritionCard extends StatelessWidget {
  final String title;
  final String label;
  final String icon;
  final double percent;
  const NutritionCard({
    super.key,
    required this.title,
    required this.label,
    required this.icon,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            AppShadows.shadowCard,
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Calories',
                        style: AppText.small.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        )),
                    SvgPicture.asset(
                      AppIcons.ic_fire,
                      height: 18,
                    ),
                  ],
                ),
              ),
              Text('320 kCal',
                  style: AppText.caption.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray_1,
                    height: 1.5,
                  ))
            ],
          ),
          Row(
            children: [
              BarIndicator(
                percent: percent,
                height: 10,
                width: MediaQuery.sizeOf(context).width -
                    (AppStyles.paddingBothSidesPage + 15) * 2,
                gradient: AppColors.primaryGradiant,
                direction: Direction.vertical,
              )
            ],
          )
        ],
      ),
    );
  }
}
