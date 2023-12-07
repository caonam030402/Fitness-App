import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/pages/dashboard/activityTracker/widgets/banner_activity_tracker.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            BannerActivityTracker()
          ],
        ),
      ),
    );
  }
}
