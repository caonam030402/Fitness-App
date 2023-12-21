import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pages/workout/workoutDetail/widgets/exercise_item.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum Type { totalSeconds, totalCalories }

class WorkupTrackerDetail extends StatelessWidget {
  const WorkupTrackerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Workout workout =
        ModalRoute.of(context)!.settings.arguments as Workout;

    total(Type type) {
      int total = 0;
      for (var i = 0; i < workout.workoutDetail.length; i++) {
        total = type == Type.totalSeconds
            ? total + workout.workoutDetail[i].timeSeconds
            : total + workout.workoutDetail[i].colories;
      }
      return total;
    }

    Duration totalTime = Duration(seconds: total(Type.totalSeconds));

    return Scaffold(
      body: Stack(children: [
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          child: Image.network(workout.mainImage, fit: BoxFit.cover),
          decoration: const BoxDecoration(),
        ),
        Positioned(
          top: 45,
          child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: const ToolBar(title: '')),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.7,
          builder: (context, scrollController) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.paddingBothSidesPage),
                child: CustomScrollView(controller: scrollController, slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: FractionallySizedBox(
                        widthFactor: 0.2,
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.1),
                              borderRadius: AppStyles.borderRadiusCard),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fullbody Workout',
                              style: AppText.large
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${workout.workoutDetail.length} Exercises | ${totalTime.inMinutes} mins | ${total(Type.totalCalories)} Calories Burn',
                              style: AppText.small
                                  .copyWith(color: AppColors.gray_1),
                            )
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppIcons.ic_calendar)
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exercises',
                          style: AppText.medium
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '${workout.workoutDetail.length.toString()} Set',
                          style:
                              AppText.small.copyWith(color: AppColors.gray_1),
                        )
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverList.separated(
                    itemBuilder: (context, index) {
                      final workoutDetailItem = workout.workoutDetail[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              AppRoutes.workout_detail_info,
                              arguments: workoutDetailItem);
                        },
                        child: ExerciseItem(workoutDetail: workoutDetailItem),
                      );
                    },
                    itemCount: workout.workoutDetail.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                  )
                ]),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            margin: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
            child: Button(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.start_workout,
                    arguments: workout.workoutDetail);
              },
              text: 'Start Workout',
            ),
          ),
        ),
      ]),
    );
  }
}
