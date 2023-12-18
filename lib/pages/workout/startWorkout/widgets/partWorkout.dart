import 'dart:async';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/workout/startWorkout/index.dart';
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
  final indexWorkout;
  final nameWorkout;
  final int? timeWorkout;

  final PageController controllerPage;
  const PartWorkout(
      {super.key,
      required this.controllerPage,
      this.nameWorkout,
      this.timeWorkout,
      this.indexWorkout});

  @override
  State<PartWorkout> createState() => _PartWorkoutState();
}

class _PartWorkoutState extends State<PartWorkout> {
  Timer? countdownTimerIntro;
  Timer? countdownTimerExercise;
  late Duration durationExercise;
  late VideoPlayerController controller;

  loadVideoPlayer() {
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  Duration durationIntro = Duration(seconds: 5);

  bool isModalPause = false;

  @override
  void initState() {
    super.initState();

    durationExercise = Duration(seconds: widget.timeWorkout ?? 10);
    startTime(CountDownType.countDownIntro);
  }

  void startTime(CountDownType countDownType) {
    countdownTimerIntro = Timer.periodic(
        const Duration(seconds: 1), (_) => setCountDown(countDownType));
  }

  void nextPage() {
    if (widget.controllerPage.hasClients) {
      if (widget.indexWorkout != startWorkUps.length - 1) {
        widget.controllerPage.animateToPage(
          widget.indexWorkout + 1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void prevPage() {
    if (widget.controllerPage.hasClients) {
      widget.controllerPage.animateToPage(
        widget.indexWorkout - 1,
        duration: Duration(milliseconds: 200),
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
    final convertTimeToInt = int.parse(durationIntro.inSeconds.toString());
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                    child: SmoothPageIndicator(
                  controller: widget.controllerPage,
                  count: 10,
                  effect: SlideEffect(
                      dotHeight: 4,
                      dotColor: AppColors.gray_1,
                      activeDotColor: AppColors.primary),
                )),
                SizedBox(
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
                        padding: EdgeInsets.all(5),
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(AppIcons.ic_close),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white),
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Exercises 2/16',
                          style: AppText.large
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text('00:38',
                            style: AppText.medium.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray_1))
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
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.nameWorkout,
                          style: AppText.heading4
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AppRoutes.workout_detail_more,
                                arguments: widget.nameWorkout);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.gray_1, width: 1)),
                            child: Text('?'),
                          ),
                        )
                      ],
                    ),
                    Text(
                      '${durationExercise.inMinutes.toString().padLeft(2, '0')}:${durationExercise.inSeconds.toString().padLeft(2, '0')}',
                      style: AppText.heading1
                          .copyWith(fontSize: 65, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
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
                              padding: EdgeInsets.all(10),
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
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isModalPause = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
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
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              nextPage();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
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
                    Spacer(),
                  ],
                ),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 300,
              ),
            )),
        Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            child: widget.indexWorkout == 0
                ? IntroWorkup(
                    durationIntro: durationIntro,
                    onPressedButtonStart: () {
                      setState(() {
                        durationIntro = Duration(seconds: 0);
                      });
                    },
                  )
                : IntroNextWork(
                    durationIntro: durationIntro,
                    onPressedButtonAddTime: () {
                      setState(() {
                        durationIntro = durationIntro + Duration(seconds: 20);
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
                  durationExercise = Duration(seconds: 10);
                  isModalPause = false;
                });
              },
              onPressedQuit: () {
                setState(() {
                  isModalPause = false;
                });
              },
            )),
      ],
    );
  }
}
