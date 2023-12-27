import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class PauseWorkout extends StatelessWidget {
  final bool isModalPause;
  final void Function()? onPressedResume;
  final void Function()? onPressedRestart;
  final void Function()? onPressedQuit;

  const PauseWorkout(
      {super.key,
      required this.isModalPause,
      this.onPressedResume,
      this.onPressedRestart,
      this.onPressedQuit});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isModalPause ? true : false,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                const Color.fromARGB(255, 255, 255, 255),
                const Color.fromARGB(255, 255, 255, 255),
                AppColors.white.withOpacity(0.2)
              ])),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Hold on!',
                  style: AppText.heading1.copyWith(fontWeight: FontWeight.w700),
                ),
                Text('You can do it!',
                    style:
                        AppText.heading1.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 15,
                ),
                Text('You have finished 0%',
                    style:
                        AppText.medium.copyWith(fontWeight: FontWeight.w500)),
                Text('Only 15 exercises left',
                    style:
                        AppText.medium.copyWith(fontWeight: FontWeight.w500)),
                Padding(
                  padding:
                      const EdgeInsets.all(AppStyles.paddingBothSidesPage + 20),
                  child: Column(children: [
                    Button(
                      text: 'Resume',
                      onPressed: onPressedResume,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Button(
                      color: AppColors.whiteGradiant,
                      textStyle: AppText.large.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.black),
                      text: 'Restart this exercise',
                      onPressed: onPressedRestart,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: onPressedQuit,
                      child: Text(
                        'Quit',
                        style: AppText.large.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.gray_1),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
