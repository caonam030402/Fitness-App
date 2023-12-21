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
    return Container(
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(workoutDetail.image, fit: BoxFit.cover),
            ),
            decoration: BoxDecoration(
              color: AppColors.gray_3,
            ),
          ),
          SizedBox(
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
          Spacer(),
          Container(
            width: 20,
            height: 20,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.gray_1, width: 1)),
            child: SvgPicture.asset(
              AppIcons.ic_arrow_right,
              color: AppColors.gray_1,
            ),
          )
        ],
      ),
    );
  }
}
