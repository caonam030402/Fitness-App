import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class IntroWorkup extends StatelessWidget {
  final durationIntro;
  final WorkoutDetail workoutDetail;
  final void Function()? onPressedButtonStart;
  const IntroWorkup(
      {super.key,
      this.durationIntro,
      this.onPressedButtonStart,
      required this.workoutDetail});

  @override
  Widget build(BuildContext context) {
    // final audioPlayer = AudioPlayer();

    return Visibility(
      visible:
          int.parse(durationIntro.inSeconds.toString()) == 0 ? false : true,
      child: Container(
        child: SizedBox(
          height: MediaQuery.of(context).size.width,
          child: Column(children: [
            Spacer(),
            SizedBox(
              height: 30,
            ),
            Text(
              'READY TO GO',
              style: AppText.heading1.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            ),
            Text(durationIntro.inSeconds.toString(),
                style: AppText.heading1.copyWith(
                    fontSize: 100,
                    color: AppColors.white,
                    fontWeight: FontWeight.w800)),
            Text(
              'Exercise 1/16',
              style: AppText.medium.copyWith(color: AppColors.white),
            ),
            Text(workoutDetail.name.toUpperCase(),
                style: AppText.heading4.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w700)),
            SizedBox(
              height: 40,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppStyles.paddingBothSidesPage,
                  right: AppStyles.paddingBothSidesPage,
                  bottom: AppStyles.paddingBothSidesPage),
              child: Button(
                text: 'Start!',
                size: Size.large,
                onPressed: onPressedButtonStart,
              ),
            )
          ]),
        ),
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.4),
        ),
      ),
    );
  }
}
