import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/pages/dashboard/activityTracker/widgets/banner_activity_tracker.dart';
import 'package:fitness_app/pages/dashboard/activityTracker/widgets/last_avtivity_card.dart';
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
