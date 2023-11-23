import 'package:fitness_app/components/banner_big.dart';
import 'package:fitness_app/components/button_floating.dart';
import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/components/list_view_item.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              padding: EdgeInsets.only(
                  bottom: AppStyles.heightBottomNavigation + 30),
              child: Column(
                children: [
                  SizedBox(
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
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.red.withOpacity(0.1),
                                      borderRadius: AppStyles.borderRadiusCard),
                                  padding: AppStyles.paddingCard,
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.white
                                                  .withOpacity(0.5)),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppIcons.ic_clock_and_calendar,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Reminder!',
                                            style: AppText.small.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.red),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Next Photos Fall On July 08',
                                            style: AppText.small.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              foregroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          99))),
                                          child: SvgPicture.asset(
                                              AppIcons.ic_close)),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            BannerBig(
                              content: 'Track Your Progress Each Month With ',
                              contentColor: 'Photo',
                            ),
                            SizedBox(
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
                            SizedBox(
                              height: 10,
                            ),
                            TitleSection(
                              title: 'Gallery',
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.result);
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ListViewItem(date: '2 June', item: ListItem),
                            ListViewItem(date: '2 June', item: ListItem),
                            ListViewItem(date: '2 June', item: ListItem),
                            ListViewItem(date: '5 May', item: ListItem1),
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
