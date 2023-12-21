import 'package:fitness_app/components/bar_indicator.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class ProgressBarCard extends StatelessWidget {
  const ProgressBarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 112,
          width: MediaQuery.of(context).size.width -
              (AppStyles.paddingBothSidesPage * 2),
          decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.2),
              borderRadius: AppStyles.borderRadiusCard),
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 210,
                      child: Text(
                        'You will get 8hours 10minutes for tonight',
                        style: AppText.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    children: [
                      BarIndicator(
                        isSizeTextPercentSmall: true,
                        isLabelPercent: true,
                        direction: Direction.vertical,
                        height: 15,
                        width: MediaQuery.of(context).size.width -
                            ((AppStyles.paddingBothSidesPage + 20) * 2),
                        percent: 0.96,
                        gradient: AppColors.secondaryGradiant,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
