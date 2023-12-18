import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class WorkupDetailMore extends StatefulWidget {
  const WorkupDetailMore({super.key});

  @override
  State<WorkupDetailMore> createState() => _WorkupDetailMoreState();
}

class _WorkupDetailMoreState extends State<WorkupDetailMore> {
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
    final workoutDetail = ModalRoute.of(context)!.settings.arguments;
    print(workoutDetail);

    return Scaffold(
      appBar: ToolBar(title: ''),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSidesPage),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: AppStyles.borderRadiusCard),
                height: 200,
                // child: VideoPlayer(controller),
              ),
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
                  Text('Jumping Jack',
                      style: AppText.heading4
                          .copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Easy | 390 Calories Burn',
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
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: AppStyles.paddingBothSidesPage),
              child: Button(
                onPressed: () {},
                text: 'Start Workout',
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
