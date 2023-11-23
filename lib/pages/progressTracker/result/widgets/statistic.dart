import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 300,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  LineSeries<ChartData, String>(
                      dataSource: [
                        ChartData('Jan', 35, Colors.red),
                        ChartData('Feb', 28, Colors.green),
                        ChartData('Mar', 34, Colors.blue),
                        ChartData('Apr', 32, Colors.pink),
                        ChartData('May', 40, Colors.black)
                      ],
                      // Bind the color for all the data points from the data source
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ])),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
