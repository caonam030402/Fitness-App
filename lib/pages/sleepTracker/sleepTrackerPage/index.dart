import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/components/schedule.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/sleepTracker/sleepTrackerPage/widgets/graph_section.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class SleepTrackerPage extends StatelessWidget {
  const SleepTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: 'Sleep Tracker', isBackHome: true),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: AppStyles.heightBottomNavigation,
            left: AppStyles.paddingBothSidesPage,
            right: AppStyles.paddingBothSidesPage),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            SliverToBoxAdapter(
              child: DailyAction(
                title: 'Daily Sleep Schedule',
                textAction: 'Check',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.sleepSchedule);
                },
              ),
            ),
            // SliverToBoxAdapter(child: const BannerSleep()),
            const SliverToBoxAdapter(child: GraphSection()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            // const SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 30,
            //   ),
            // ),

            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SliverToBoxAdapter(
              child: TitleSection(
                title: 'Today Schedule',
                hiddenAction: true,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverList.separated(
              itemCount: scheduleItem.length,
              itemBuilder: (context, index) {
                final item = scheduleItem[index];
                return Schedule(
                  hour: item.hour,
                  icon: item.icon,
                  label: item.label,
                  time: item.time,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 4,
                );
              },
            )
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
