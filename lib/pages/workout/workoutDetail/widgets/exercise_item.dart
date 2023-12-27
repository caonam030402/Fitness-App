import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseItem extends StatelessWidget {
  final WorkoutDetail workoutDetail;
  const ExerciseItem({super.key, required this.workoutDetail});

  @override
  Widget build(BuildContext context) {
    Duration time = Duration(seconds: workoutDetail.timeSeconds);
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: AppColors.gray_3,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(workoutDetail.imageUrl, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workoutDetail.name,
              style: AppText.medium.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              '${time.inMinutes.toString().padLeft(2, '0')}:${time.inSeconds.toString().padLeft(2, '0')}',
              style: AppText.small.copyWith(color: AppColors.gray_1),
            )
          ],
        ),
        const Spacer(),
        Container(
          width: 20,
          height: 20,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.gray_1, width: 1)),
          child: SvgPicture.asset(
            AppIcons.ic_arrow_right,
            color: AppColors.gray_1,
          ),
        )
      ],
    );
  }
}
