import 'package:fitness_app/styles/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartResult extends StatelessWidget {
  const ChartResult({super.key});

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
                    const FlSpot(0, 2),
                    const FlSpot(1.5, 3.8),
                    const FlSpot(2.9, 1.3),
                    const FlSpot(5, 5),
                    const FlSpot(6, 4),
                  ],
                  isCurved: true,
                  color: AppColors.primary,
                  dotData: const FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 1),
                    const FlSpot(1, 0.8),
                    const FlSpot(3, 2.7),
                    const FlSpot(5, 1.3),
                    const FlSpot(6, 2),
                  ],
                  isCurved: true,
                  color: AppColors.red.withOpacity(0.2),
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
      text = 'Jan';
      break;
    case 1:
      text = 'Feb';
      break;
    case 2:
      text = 'Mar';
      break;
    case 3:
      text = 'Apr';
      break;
    case 4:
      text = 'May';
      break;
    case 5:
      text = 'Jun';
      break;
    case 6:
      text = 'Jul';
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

// import 'dart:ffi';

// import 'package:fitness_app/styles/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ChartResult extends StatefulWidget {
//   const ChartResult({super.key});

//   @override
//   State<ChartResult> createState() => _ChartResultState();
// }

// class _ChartResultState extends State<ChartResult> {
//   final List<ChartData> chartData = [
//     ChartData('Jan', 6),
//     ChartData('Feb', 11),
//     ChartData('Mar', 9),
//     ChartData('Apr', 14),
//     ChartData('May', 10),
//     ChartData('Jun', 10),
//     ChartData('Jul', 10),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//         primaryXAxis: CategoryAxis(),
//         series: <CartesianSeries>[
//           LineSeries<ChartData, String>(
//               dataSource: chartData,
//               xValueMapper: (ChartData data, _) => data.x,
//               yValueMapper: (ChartData data, _) => data.y,
//               markerSettings: const MarkerSettings(isVisible: true))
//         ]);
//   }
// }

// class ChartData {
//   final String x;
//   final double y;
//   ChartData(this.x, this.y);
// }
