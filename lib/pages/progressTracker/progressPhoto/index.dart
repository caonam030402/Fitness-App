import 'package:fitness_app/components/banner_big.dart';
import 'package:fitness_app/components/button_floating.dart';
import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/pages/progressTracker/progressPhoto/widgets/list_item_photo.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/progressTracker/progressPhoto/widgets/warning.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProgressPhotoPage extends StatelessWidget {
  const ProgressPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: AppStyles.heightBottomNavigation + 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppStyles.paddingBothSidesPage),
                    child: Column(
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
                            Navigator.of(context).pushNamed(AppRoutes.result);
                          },
                        ),
                        SizedBox(
                            height: 150 * listItemPhotoItem.length.toDouble(),
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listItemPhotoItem.length,
                              itemBuilder: (context, index) {
                                final item = listItemPhotoItem[index];
                                return ListItemPhoto(
                                  date: item.date,
                                  item: item.list,
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                ],
              ),
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
    );
  }
}

class ListItemPhotoItem {
  String date;
  List list;
  ListItemPhotoItem({required this.date, required this.list});
}

List<ListItemPhotoItem> listItemPhotoItem = [
  ListItemPhotoItem(
    date: '2 June',
    list: [
      AppIcons.im_muscle_relaxants,
      AppIcons.im_weightlifting,
      AppIcons.im_jogging,
      AppIcons.im_weightlifting,
      AppIcons.im_muscle_relaxants,
      AppIcons.im_jogging,
    ],
  ),
  ListItemPhotoItem(date: '2 June', list: [
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
  ]),
  ListItemPhotoItem(date: '2 June', list: [
    AppIcons.im_muscle_relaxants,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_jogging,
  ]),
  ListItemPhotoItem(date: '2 June', list: [
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
    AppIcons.im_jogging,
    AppIcons.im_weightlifting,
    AppIcons.im_muscle_relaxants,
  ]),
];
