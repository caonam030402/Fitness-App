import 'package:fitness_app/components/banner_big.dart';
import 'package:fitness_app/components/button_floating.dart';
import 'package:fitness_app/components/schedule.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/components/date.dart';
import 'package:fitness_app/pages/sleepTracker/sleepSchedule/widgets/progress_bar_card.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class SleepSchedulePage extends StatelessWidget {
  const SleepSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: 'Sleep Schedule'),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.paddingBothSidesPage),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const BannerBig(
                  text: 'Ideal Hours for Sleep  ',
                  contentColor: '8hours 30minutes',
                  icon: AppIcons.vt_moon,
                ),
                const SizedBox(
                  height: 15,
                ),
                const TitleSection(title: 'Your Schedule', hiddenAction: true),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dateItem.length,
                    itemBuilder: (context, index) {
                      final item = dateItem[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Date(
                          label: item.label,
                          date: item.date,
                          isDateNow: item.isDateNow,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 108 * scheduleItem.length.toDouble(),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                ),
                const ProgressBarCard(),
              ],
            ),
          ),
          Positioned(
            bottom: AppStyles.paddingBothSidesPage,
            right: AppStyles.paddingBothSidesPage,
            child: ButtonFloating(
              icon: AppIcons.ic_plus,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.addAlarm);
              },
            ),
          ),
        ],
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

class DateItem {
  String date;
  String label;
  bool isDateNow;

  DateItem({required this.date, required this.label, this.isDateNow = false});
}

List<DateItem> dateItem = [
  DateItem(
    date: '11',
    label: 'Tue',
  ),
  DateItem(
    date: '12',
    label: 'Wed',
  ),
  DateItem(
    date: '13',
    label: 'Thus',
  ),
  DateItem(
    date: '14',
    label: 'Fri',
    isDateNow: true,
  ),
  DateItem(
    date: '15',
    label: 'Sat',
  ),
  DateItem(
    date: '16',
    label: 'Sun',
  ),
];

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
