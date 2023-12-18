import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/workout/workoutDetail/widgets/exercise_item.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkupTrackerDetail extends StatelessWidget {
  const WorkupTrackerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primary,

      body: Stack(children: [
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppIcons.im_girl_fitness),
                  fit: BoxFit.cover)),
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
                              '11 Exercises | 32mins | 320 Calories Burn',
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
                          '3 set',
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.workout_detail_more);
                        },
                        child: ExerciseItem(),
                      );
                    },
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
                Navigator.of(context).pushNamed(AppRoutes.start_workout);
              },
              text: 'Start Workout',
            ),
          ),
        ),
      ]),
    );
  }
}
