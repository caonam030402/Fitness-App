import 'package:fitness_app/components/grid_list_item.dart';
import 'package:fitness_app/components/month.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/chart_label.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.paddingBothSidesPage),
        child: Column(
          children: [
            const ChartLabel(
              label: 'Average Progress',
              percent: 0.2,
            ),
            const Month(),
            SizedBox(
              height: 230 * gridListItems.length.toDouble(),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: gridListItems.length,
                  itemBuilder: (context, index) {
                    final item = gridListItems[index];
                    return GridListItem(
                      item: item.items,
                      title: item.title,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class GridListItems {
  String title;
  List items;
  GridListItems({required this.title, required this.items});
}

List<GridListItems> gridListItems = [
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
  GridListItems(items: [
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ], title: 'Front Facing'),
];
