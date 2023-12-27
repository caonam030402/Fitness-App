import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class IntroNextWorkout extends StatelessWidget {
  final int indexWorkout;
  final int totalPartWorkout;
  final Duration durationIntro;
  final WorkoutDetail workoutDetail;
  final void Function()? onPressedButtonAddTime;
  final void Function()? onPressedButtonSkip;

  const IntroNextWorkout(
      {super.key,
      required this.durationIntro,
      this.onPressedButtonAddTime,
      this.onPressedButtonSkip,
      required this.workoutDetail,
      required this.indexWorkout,
      required this.totalPartWorkout});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          int.parse(durationIntro.inSeconds.toString()) == 0 ? false : true,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            const Spacer(),
            Text(
              'Rest',
              style: AppText.heading4.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
            Text(
                '${durationIntro.inMinutes.toString().padLeft(2, '0')}:${durationIntro.inSeconds.toString().padLeft(2, '0')}',
                style: AppText.heading1.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  size: Size.medium,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  textStyle:
                      AppText.large.copyWith(fontWeight: FontWeight.w700),
                  color: AppColors.secondaryGradiant,
                  text: '+20s',
                  onPressed: onPressedButtonAddTime,
                ),
                const SizedBox(
                  width: 20,
                ),
                Button(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: AppColors.whiteGradiant,
                  textStyle: AppText.large.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.gray_1),
                  size: Size.medium,
                  text: 'SKIP',
                  onPressed: onPressedButtonSkip,
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NEXT ${indexWorkout + 1}/$totalPartWorkout',
                        style: AppText.medium.copyWith(color: AppColors.white),
                      ),
                      Text(
                        workoutDetail.name.toUpperCase(),
                        style: AppText.large.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text('x 20',
                      style: AppText.large.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w700))
                ],
              ),
            ),
            Container(
              height: 320,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Image.network(
                  workoutDetail.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
