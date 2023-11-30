import 'package:fitness_app/pages/progressTracker/components/month.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/chart_result.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSidesPage),
      child: Column(
        children: [ChartResult(), Month()],
      ),
    );
  }
}
