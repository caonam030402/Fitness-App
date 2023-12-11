import 'package:fitness_app/components/bar_indicator.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/pages/dashboard/activityTracker/widgets/banner_activity_tracker.dart';
import 'package:fitness_app/pages/dashboard/activityTracker/widgets/last_avtivity_card.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ActivityTracker extends StatelessWidget {
  const ActivityTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: 'Activity Tracker'),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSidesPage),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: BannerActivityTracker(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TitleSection(
                    title: 'Activity Progress',
                    typeAction: TypeAction.select,
                  ),
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final item = listActivityProgress[index];
                          return BarIndicator(
                            footer: item.label,
                            percent: item.progress,
                            gradient: index % 2 == 0
                                ? AppColors.primaryGradiant
                                : AppColors.secondaryGradiant,
                            height: 140,
                            direction: Direction.horizontal,
                            width: 22,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: (MediaQuery.of(context).size.width -
                                    ((AppStyles.paddingBothSidesPage * 2) +
                                        20)) /
                                18,
                          );
                        },
                        itemCount: listActivityProgress.length),
                    padding: AppStyles.paddingCard,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: AppStyles.borderRadiusCard,
                        boxShadow: [AppShadows.shadowCard]),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 17,
              ),
            ),
            SliverToBoxAdapter(
              child: TitleSection(
                title: 'Latest Activity',
                onPressed: () {},
              ),
            ),
            SliverList.separated(
              itemCount: listActivityTracker.length,
              itemBuilder: (context, index) {
                return LastActivityCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
            )
          ],
        ),
      ),
    );
  }
}

class ActivityTrackerClass {
  String title;
  String desc;
  String image;

  ActivityTrackerClass({
    required this.title,
    required this.desc,
    required this.image,
  });
}

List<ActivityTrackerClass> listActivityTracker = [
  ActivityTrackerClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Fullbody Workout'),
  ActivityTrackerClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  ActivityTrackerClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  ActivityTrackerClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  ActivityTrackerClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  ActivityTrackerClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  ActivityTrackerClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout')
];

class ActivityProgress {
  double progress;
  String label;

  ActivityProgress({
    required this.progress,
    required this.label,
  });
}

List<ActivityProgress> listActivityProgress = [
  ActivityProgress(label: 'Sun', progress: 0.3),
  ActivityProgress(label: 'Mon', progress: 0.4),
  ActivityProgress(label: 'Tue', progress: 0.2),
  ActivityProgress(label: 'Wed', progress: 0.9),
  ActivityProgress(label: 'Thu', progress: 0.5),
  ActivityProgress(label: 'Fri', progress: 0.6),
  ActivityProgress(label: 'Sat', progress: 0.3),
];
