import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/components/video_item.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class WorkupDetailInfo extends StatefulWidget {
  const WorkupDetailInfo({super.key});

  @override
  State<WorkupDetailInfo> createState() => _WorkupDetailInfoState();
}

class _WorkupDetailInfoState extends State<WorkupDetailInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WorkoutDetail workoutDetail =
        ModalRoute.of(context)!.settings.arguments as WorkoutDetail;

    return Scaffold(
      appBar: const ToolBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.paddingBothSidesPage),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: VideoItem(
                  videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
                      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4')),
                  looping: false,
                  autoplay: true,
                ),
              ),
              // Container(
              //   height: 200,
              //   decoration: BoxDecoration(
              //       color: AppColors.primary,
              //       borderRadius: AppStyles.borderRadiusCard),
              // ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(workoutDetail.name,
                      style: AppText.heading4
                          .copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    '${workoutDetail.calories} Calories Burn',
                    style: AppText.medium.copyWith(color: AppColors.gray_1),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Descriptions',
                  style: AppText.large.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 15,
              ),
              ReadMoreText(
                workoutDetail.description,
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
              const SizedBox(
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
