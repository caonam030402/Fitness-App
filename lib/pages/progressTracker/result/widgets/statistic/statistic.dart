import 'package:fitness_app/pages/progressTracker/components/month.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/statistic/chart_result.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/statistic/indicator_label.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSidesPage),
        child: Column(
          children: [
            ChartResult(),
            Month(),
            IndicatorLabel(
              label: 'Lose Weight',
              percent: 0.33,
            ),
            IndicatorLabel(
              label: 'Height Increase',
              percent: 0.93,
            ),
            IndicatorLabel(
              label: 'Muscle Mass Increase',
              percent: 0.57,
            ),
            IndicatorLabel(
              label: 'Abs',
              percent: 0.89,
            ),
            IndicatorLabel(
              label: 'Abs',
              percent: 0.1,
            ),
            IndicatorLabel(
              label: 'Abs',
              percent: 0.01,
            )
          ],
        ),
      ),
    );
  }
}
