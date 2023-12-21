import 'package:fitness_app/components/bar_indicator.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class IndicatorLabel extends StatelessWidget {
  final String label;
  final double percent;
  const IndicatorLabel({super.key, required this.label, required this.percent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 71,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: AppText.medium.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
                child: Text('${(percent * 100).round().toInt()}%',
                    style: AppText.small.copyWith(
                        fontWeight: FontWeight.w400, color: AppColors.gray_1)),
              ),
              BarIndicator(
                percent: percent,
                height: 10,
                gradient: AppColors.secondaryGradiant,
                direction: Direction.vertical,
                color: AppColors.primary,
                width: MediaQuery.of(context).size.width -
                    (AppStyles.paddingBothSidesPage * 2) -
                    (30 * 2),
              ),
              SizedBox(
                width: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${((1 - percent) * 100).round().toInt()}%',
                        style: AppText.small.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_1)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
