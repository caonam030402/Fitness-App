import 'package:fitness_app/components/month.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/chart_result.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/indicator_label.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSidesPage),
        child: Column(
          children: [
            ChartResult(),
            Month(),
            SizedBox(
              height: 71 * indicatorLabelItem.length.toDouble(),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: indicatorLabelItem.length,
                  itemBuilder: (context, index) {
                    final item = indicatorLabelItem[index];
                    return IndicatorLabel(
                      label: item.label,
                      percent: item.percent,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class IndicatorLabelItem {
  String label;
  double percent;
  IndicatorLabelItem({required this.label, required this.percent});
}

List<IndicatorLabelItem> indicatorLabelItem = [
  IndicatorLabelItem(
    label: 'Lose Weight',
    percent: 0.33,
  ),
  IndicatorLabelItem(
    label: 'Height Increase',
    percent: 0.93,
  ),
  IndicatorLabelItem(
    label: 'Muscle Mass Increase',
    percent: 0.57,
  ),
  IndicatorLabelItem(
    label: 'Abs',
    percent: 0.89,
  ),
  IndicatorLabelItem(
    label: 'Abs',
    percent: 0.1,
  ),
  IndicatorLabelItem(
    label: 'Abs',
    percent: 0.01,
  )
];
