import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: AppStyles.paddingCard,
      decoration: BoxDecoration(
          borderRadius: AppStyles.borderRadiusCard,
          color: AppColors.primary.withOpacity(0.2)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workout.name,
                style: AppText.medium.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${workout.details.length} Exercises | ${workout.details[0].timeSeconds} mins',
                style: AppText.small.copyWith(color: AppColors.gray_1),
              ),
              const SizedBox(
                height: 17,
              ),
              Button(
                textStyle: AppText.caption.copyWith(color: AppColors.primary),
                color: AppColors.whiteGradiant,
                text: 'View more',
                size: Size.medium,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      AppRoutes.workout_tracker_detail,
                      arguments: workout);
                },
              )
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: 120,
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.network(workout.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              // Positioned(
              //     top: 0,
              //     right: 0,
              //     bottom: 0,
              //     left: 0,
              //     child: SvgPicture.network(image))
            ],
          )
        ],
      ),
    );
  }
}
