import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class IntroNextWork extends StatelessWidget {
  final durationIntro;
  final void Function()? onPressedButtonAddTime;
  final void Function()? onPressedButtonSkip;

  const IntroNextWork(
      {super.key,
      this.durationIntro,
      this.onPressedButtonAddTime,
      this.onPressedButtonSkip});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          int.parse(durationIntro.inSeconds.toString()) == 0 ? false : true,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Spacer(),
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  textStyle:
                      AppText.large.copyWith(fontWeight: FontWeight.w700),
                  color: AppColors.secondaryGradiant,
                  text: '+20s',
                  onPressed: onPressedButtonAddTime,
                ),
                SizedBox(
                  width: 20,
                ),
                Button(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: AppColors.whiteGradiant,
                  textStyle: AppText.large.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.gray_1),
                  size: Size.medium,
                  text: 'SKIP',
                  onPressed: onPressedButtonSkip,
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NEXT 3/16',
                        style: AppText.medium.copyWith(color: AppColors.white),
                      ),
                      Text(
                        'RUSSIAN TWIST',
                        style: AppText.large.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Spacer(),
                  Text('x 20',
                      style: AppText.large.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w700))
                ],
              ),
            ),
            Container(
              height: 320,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            )
          ]),
        ),
      ),
    );
  }
}
