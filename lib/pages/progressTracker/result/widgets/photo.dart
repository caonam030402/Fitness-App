import 'package:fitness_app/components/grid_list_item.dart';
import 'package:fitness_app/pages/progressTracker/components/month.dart';
import 'package:fitness_app/pages/progressTracker/progressTracker/progress_tracker_page.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/chart_label.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSidesPage),
        child: Column(
          children: [
            ChartLabel(
              title: 'Average Progress',
            ),
            Month(),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
            GridListItem(item: ListItem, title: 'Front Facing'),
          ],
        ),
      ),
    );
  }
}
