import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:fitness_app/components/video_item.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pages/workout/startWorkout/widgets/introNextWorkout.dart';
import 'package:fitness_app/pages/workout/startWorkout/widgets/introWorkout.dart';
import 'package:fitness_app/pages/workout/startWorkout/widgets/pauseWorkout.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

enum CountDownType { countDownExercise, countDownIntro }

class PartWorkout extends StatefulWidget {
  final int indexWorkout;
  final int totalPartWorkout;
  final WorkoutDetail workoutDetail;
  final PageController controllerPage;

  const PartWorkout(
      {super.key,
      required this.controllerPage,
      required this.indexWorkout,
      required this.workoutDetail,
      required this.totalPartWorkout});

  @override
  State<PartWorkout> createState() => _PartWorkoutState();
}

class _PartWorkoutState extends State<PartWorkout> {
  Timer? countdownTimerIntro;
  Timer? countdownTimerExercise;
  late Duration durationExercise;
  late Duration durationIntro;
  bool isModalPause = false;

  @override
  void initState() {
    super.initState();
    durationIntro = Duration(seconds: widget.indexWorkout == 0 ? 5 : 15);
    durationExercise = Duration(seconds: widget.workoutDetail.timeSeconds);
    startTime(CountDownType.countDownIntro);
  }

  void startTime(CountDownType countDownType) {
    countdownTimerIntro = Timer.periodic(
        const Duration(seconds: 1), (_) => setCountDown(countDownType));
  }

  void nextPage() {
    if (widget.controllerPage.hasClients) {
      if (widget.indexWorkout != 5 - 1) {
        widget.controllerPage.animateToPage(
          widget.indexWorkout + 1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void prevPage() {
    if (widget.controllerPage.hasClients) {
      widget.controllerPage.animateToPage(
        widget.indexWorkout - 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  void setCountDown(CountDownType countDowntype) {
    final checkType = countDowntype == CountDownType.countDownIntro;
    setState(() {
      final seconds = checkType
          ? durationIntro.inSeconds - 1
          : durationExercise.inSeconds - 1;
      if (seconds < 0) {
        if (checkType) {
          countdownTimerIntro!.cancel();
          startTime(CountDownType.countDownExercise);
        } else {
          nextPage();
        }
        countdownTimerExercise?.cancel();
      } else {
        checkType
            ? durationIntro = Duration(seconds: seconds)
            : durationExercise = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    countdownTimerIntro?.cancel();
    countdownTimerExercise?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Duration timePartWorkout =
        Duration(seconds: widget.workoutDetail.timeSeconds);
    final convertTimeToInt = int.parse(durationIntro.inSeconds.toString());
    return Stack(
      children: [
        Container(
          color: const Color(0x00e1dde2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: VideoItem(
            videoPlayerController:
                VideoPlayerController.asset('assets/videos/1.mp4'),
            looping: false,
            autoplay: true,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SmoothPageIndicator(
                  controller: widget.controllerPage,
                  count: widget.totalPartWorkout,
                  effect: const SlideEffect(
                      dotHeight: 4,
                      dotColor: AppColors.gray_1,
                      activeDotColor: AppColors.primary),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isModalPause = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white),
                        child: SvgPicture.asset(AppIcons.ic_close),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Exercises ${widget.indexWorkout + 1}/${widget.totalPartWorkout}',
                          style: AppText.large
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                            '${timePartWorkout.inMinutes.toString().padLeft(2, '0')}:${timePartWorkout.inSeconds.toString().padLeft(2, '0')}',
                            style: AppText.medium.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray_1)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Visibility(
              visible: convertTimeToInt != 0 ? false : true,
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 300,
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.workoutDetail.name,
                          style: AppText.heading4
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AppRoutes.workout_detail_info,
                                arguments: widget.workoutDetail);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.gray_1, width: 1)),
                            child: const Text('?'),
                          ),
                        )
                      ],
                    ),
                    Text(
                      '${durationExercise.inMinutes.toString().padLeft(2, '0')}:${durationExercise.inSeconds.toString().padLeft(2, '0')}',
                      style: AppText.heading1
                          .copyWith(fontSize: 65, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: widget.indexWorkout == 0 ? 0 : 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                prevPage();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.gray_3,
                                  borderRadius: BorderRadius.circular(100)),
                              child: SvgPicture.asset(
                                AppIcons.ic_prev,
                                width: 24,
                                height: 24,
                                color: AppColors.gray_1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isModalPause = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 8),
                            decoration: BoxDecoration(
                                gradient: AppColors.primaryGradiant,
                                borderRadius: BorderRadius.circular(100)),
                            child: SvgPicture.asset(
                              AppIcons.ic_pause,
                              width: 32,
                              height: 32,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              nextPage();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.gray_3,
                                borderRadius: BorderRadius.circular(100)),
                            child: SvgPicture.asset(
                              AppIcons.ic_next,
                              width: 24,
                              height: 24,
                              color: AppColors.gray_1,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )),
        Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            child: widget.indexWorkout == 0
                ? IntroWorkup(
                    workoutDetail: widget.workoutDetail,
                    durationIntro: durationIntro,
                    onPressedButtonStart: () {
                      setState(() {
                        durationIntro = const Duration(seconds: 0);
                      });
                    },
                  )
                : IntroNextWorkout(
                    indexWorkout: widget.indexWorkout,
                    totalPartWorkout: widget.totalPartWorkout,
                    workoutDetail: widget.workoutDetail,
                    durationIntro: durationIntro,
                    onPressedButtonAddTime: () {
                      setState(() {
                        durationIntro =
                            durationIntro + const Duration(seconds: 20);
                      });
                    },
                    onPressedButtonSkip: () {
                      setState(() {
                        durationIntro = Duration.zero;
                      });
                    },
                  )),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: PauseWorkout(
              isModalPause: isModalPause,
              onPressedResume: () {
                setState(() {
                  isModalPause = false;
                });
              },
              onPressedRestart: () {
                setState(() {
                  durationExercise =
                      Duration(seconds: widget.workoutDetail.timeSeconds);
                  isModalPause = false;
                });
              },
              onPressedQuit: () async {
                Navigator.of(context).pushReplacementNamed(AppRoutes.main);
              },
            )),
      ],
    );
  }
}
