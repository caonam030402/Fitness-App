import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class WorkupDetailInfo extends StatefulWidget {
  const WorkupDetailInfo({super.key});

  @override
  State<WorkupDetailInfo> createState() => _WorkupDetailInfoState();
}

class _WorkupDetailInfoState extends State<WorkupDetailInfo> {
  // late VideoPlayerController controller;

  // loadVideoPlayer() {
  //   controller = VideoPlayerController.networkUrl(Uri.parse(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  //   controller.addListener(() {
  //     setState(() {});
  //   });
  //   controller.initialize().then((value) {
  //     setState(() {});
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // loadVideoPlayer();
    // controller.play();
  }

  @override
  Widget build(BuildContext context) {
    final WorkoutDetail workoutDetail =
        ModalRoute.of(context)!.settings.arguments as WorkoutDetail;

    return Scaffold(
      appBar: ToolBar(title: ''),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSidesPage),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   decoration:
              //       BoxDecoration(borderRadius: AppStyles.borderRadiusCard),
              //   height: 200,
              //   // child: VideoPlayer(controller),
              // ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: AppStyles.borderRadiusCard),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(workoutDetail.name,
                      style: AppText.heading4
                          .copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '${workoutDetail.colories} Calories Burn',
                    style: AppText.medium.copyWith(color: AppColors.gray_1),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Descriptions',
                  style: AppText.large.copyWith(fontWeight: FontWeight.w600)),
              SizedBox(
                height: 15,
              ),
              ReadMoreText(
                workoutDetail.desciption,
                trimLines: 2,
                style: AppText.medium.copyWith(color: AppColors.gray_1),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                lessStyle: AppText.medium.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.bold),
                moreStyle: AppText.medium.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Custom Repetitions',
                  style: AppText.large.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   left: 0,
          //   child: Container(
          //     margin:
          //         const EdgeInsets.only(bottom: AppStyles.paddingBothSidesPage),
          //     child: Button(
          //       onPressed: () {
          //         Navigator.of(context).pushNamed(AppRoutes.start_workout,
          //             arguments: workoutDetail);
          //       },
          //       text: 'Start Workout',
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
