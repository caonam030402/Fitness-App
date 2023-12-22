import 'package:fitness_app/styles/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphSection extends StatelessWidget {
  const GraphSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: LineChart(
          LineChartData(
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: AppColors.gray_2,
                      strokeWidth: 0.5,
                    );
                  }),
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: bottomTitles()),
                  rightTitles: AxisTitles(sideTitles: rightTitles()),
                  leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false))),
              minX: 0,
              maxX: 6,
              maxY: 6,
              minY: -1,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 3.2),
                    const FlSpot(0.7, 2.3),
                    const FlSpot(1.8, 3.3),
                    const FlSpot(2.7, 1.8),
                    const FlSpot(3.8, 4),
                    const FlSpot(4.8, 1),
                    const FlSpot(5.5, 2.4),
                    const FlSpot(6, 3),
                  ],
                  isCurved: true,
                  color: AppColors.primary,
                  dotData: const FlDotData(show: false),
                ),
              ]),
        ),
      ),
    );
  }
}

Widget rightTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.gray_1);
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0%';
      break;
    case 1:
      text = '20%';
      break;
    case 2:
      text = '40%';
      break;
    case 3:
      text = '60%';
      break;
    case 4:
      text = '80%';
      break;
    case 5:
      text = '100%';
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.center);
}

SideTitles rightTitles() {
  return const SideTitles(
      getTitlesWidget: rightTitlesWidget,
      showTitles: true,
      interval: 1,
      reservedSize: 29);
}

Widget bottomTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.gray_1);
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Sun';
      break;
    case 1:
      text = 'Mon';
      break;
    case 2:
      text = 'Tue';
      break;
    case 3:
      text = 'Wed';
      break;
    case 4:
      text = 'Thu';
      break;
    case 5:
      text = 'Fri';
      break;
    case 6:
      text = 'Sat';
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.center);
}

SideTitles bottomTitles() {
  return const SideTitles(
      getTitlesWidget: bottomTitlesWidget,
      showTitles: true,
      interval: 1,
      reservedSize: 29);
}
