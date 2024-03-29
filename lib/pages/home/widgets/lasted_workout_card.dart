import 'package:fitness_app/components/bar_indicator.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastedWorkoutCard extends StatelessWidget {
  final WorkoutProgress? lastWorkout;
  const LastedWorkoutCard({
    super.key,
    required this.lastWorkout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
          boxShadow: [AppShadows.shadowCard],
          color: AppColors.white,
          borderRadius: AppStyles.borderRadiusCard),
      padding: AppStyles.paddingCard,
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.network(
                    '${lastWorkout?.workout?.imageUrl}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lastWorkout?.workout?.name ?? '',
                    style: AppText.medium.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    lastWorkout?.workout?.name ?? '',
                    style: AppText.caption.copyWith(color: AppColors.gray_1),
                  ),
                  BarIndicator(
                    percent: double.parse(
                        ((lastWorkout?.progress ?? 0) / 100).toString()),
                    direction: Direction.vertical,
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.5,
                    gradient: AppColors.secondaryGradiant,
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(3),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: AppColors.secondary,
                )),
            child: SvgPicture.asset(AppIcons.ic_arrow_right,
                color: AppColors.secondary),
          )
        ],
      ),
    );
  }
}
