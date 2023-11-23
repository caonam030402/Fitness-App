import 'package:fitness_app/components/photo.dart';
import 'package:fitness_app/components/statistic.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class SwitchingPhoto extends StatefulWidget {
  const SwitchingPhoto({super.key});

  @override
  State<SwitchingPhoto> createState() => _SwitchingPhotoState();
}

class _SwitchingPhotoState extends State<SwitchingPhoto>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppStyles.paddingBothSidesPage,
        ),
        Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(99)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TabBar(
                    controller: tabController,
                    unselectedLabelColor: AppColors.gray_2,
                    labelColor: AppColors.white,
                    indicator: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(99)),
                    tabs: [
                      Tab(text: 'Photo'),
                      Tab(text: 'Statistic'),
                    ]),
              ),
            ),
            SizedBox(
              height: AppStyles.paddingBothSidesPage,
            ),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: tabController,
          children: [
            Photo(),
            Statistic(),
          ],
        ))
      ],
    );
  }
}
