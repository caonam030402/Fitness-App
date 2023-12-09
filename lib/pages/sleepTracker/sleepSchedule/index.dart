import 'package:fitness_app/components/button_floating.dart';
import 'package:fitness_app/components/schedule.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class SleepSchedulePage extends StatelessWidget {
  const SleepSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: 'Sleep Schedule'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.paddingBothSidesPage),
        child: Stack(
          children: [
            Column(children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 108 * scheduleItem.length.toDouble(),
                child: ListView.builder(
                    itemCount: scheduleItem.length,
                    itemBuilder: (context, index) {
                      final item = scheduleItem[index];
                      return Schedule(
                        hour: item.hour,
                        icon: item.icon,
                        label: item.label,
                        time: item.time,
                      );
                    }),
              )
            ]),
            Positioned(
                bottom: AppStyles.paddingBothSidesPage,
                right: 0,
                child: ButtonFloating(
                  icon: AppIcons.ic_plus,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.addAlarm);
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class ScheduleItem {
  String time;
  String icon;
  String label;
  String hour;
  ScheduleItem({
    required this.time,
    required this.icon,
    required this.label,
    required this.hour,
  });
}

List<ScheduleItem> scheduleItem = [
  ScheduleItem(
    icon: AppIcons.vt_bed,
    label: 'Bedtime, ',
    time: '09:00pm',
    hour: 'in 6hours 22minutes',
  ),
  ScheduleItem(
    icon: AppIcons.vt_clock,
    label: 'Alarm, ',
    time: '05:10am',
    hour: 'in 14hours 30minutes',
  ),
];
