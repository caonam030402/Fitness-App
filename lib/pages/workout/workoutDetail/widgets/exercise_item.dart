import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.gray_3,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage(AppIcons.im_girl_fitness)
              //     )
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Warm Up',
                style: AppText.medium.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '05:00',
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
