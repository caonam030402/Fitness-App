import 'package:fitness_app/components/banner_big.dart';
import 'package:fitness_app/components/button_floating.dart';
import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/pages/progressTracker/progressTracker/widgets/list_item_photo.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/progressTracker/progressTracker/widgets/warning.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProgressTrackerPage extends StatelessWidget {
  const ProgressTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: AppStyles.heightBottomNavigation + 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppStyles.paddingBothSidesPage),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Warning(),
                            const SizedBox(
                              height: 25,
                            ),
                            const BannerBig(
                              content: 'Track Your Progress Each Month With ',
                              contentColor: 'Photo',
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            DailyAction(
                              title: 'Compare my Photo',
                              textAction: 'Compare',
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.comparison);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TitleSection(
                              title: 'Gallery',
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.result);
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const ListItemPhoto(date: '2 June', item: ListItem),
                            const ListItemPhoto(date: '2 June', item: ListItem),
                            const ListItemPhoto(date: '2 June', item: ListItem),
                            const ListItemPhoto(date: '5 May', item: ListItem1),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.width * 0.2,
              right: AppStyles.paddingBothSidesPage,
              child: ButtonFloating(
                icon: AppIcons.ic_camera_stroke,
                onPressed: () {
                  ImagePicker().pickImage(source: ImageSource.camera);
                },
              ))
        ],
      ),
    );
  }
}

const ListItem = [
  AppIcons.im_jogging,
  AppIcons.im_muscle_relaxants,
];

const ListItem1 = [
  AppIcons.im_weightlifting,
  AppIcons.im_muscle_relaxants,
  AppIcons.im_jogging,
  AppIcons.im_weightlifting,
  AppIcons.im_muscle_relaxants,
  AppIcons.im_jogging,
];
