import 'package:fitness_app/components/bar_indicator.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class ChartLabel extends StatefulWidget {
  final String title;
  final double percent = 0.8;
  const ChartLabel({super.key, required this.title});

  @override
  State<ChartLabel> createState() => _ChartLabelState();
}

class _ChartLabelState extends State<ChartLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppText.large.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.black),
            ),
            if (widget.percent >= 0.7) ...[
              Text('Good',
                  style: AppText.small.copyWith(
                      color: AppColors.green, fontWeight: FontWeight.w500))
            ] else if (widget.percent >= 0.5) ...[
              Text('Normal',
                  style: AppText.small.copyWith(
                      color: Colors.yellow, fontWeight: FontWeight.w500))
            ] else ...[
              Text('Bad',
                  style: AppText.small.copyWith(
                      color: AppColors.red, fontWeight: FontWeight.w500))
            ]
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BarIndicator(
                isBorderRadiusCenter: false,
                isLabelPercent: true,
                percent: widget.percent,
                direction: Direction.vertical,
                height: 20,
                width: MediaQuery.of(context).size.width -
                    (AppStyles.paddingBothSidesPage * 2),
                gradient: AppColors.progressBarGradiant,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
