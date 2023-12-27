import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pages/home/widgets/banner_home.dart';
import 'package:fitness_app/pages/home/widgets/lasted_workout_card.dart';
import 'package:fitness_app/pages/home/widgets/workout_card.dart';
import 'package:fitness_app/providers/userProviders.dart';
import 'package:fitness_app/services/user_services.dart';
import 'package:fitness_app/services/workout_services.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Workout>> workoutData;

  final getProfileProvider = ProfileProvider();

  WorkoutService workoutService = WorkoutService();
  UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    workoutData = workoutService.getAllWorkout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: FutureBuilder(
          future: getProfileProvider.setData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 4,
                color: AppColors.primary,
              ));
            }
            final user = getProfileProvider.user;

            return Padding(
              padding: const EdgeInsets.only(
                  bottom: AppStyles.heightBottomNavigation,
                  right: AppStyles.paddingBothSidesPage,
                  left: AppStyles.paddingBothSidesPage),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome Back,',
                                style: AppText.small
                                    .copyWith(color: AppColors.gray_2)),
                            Text(getProfileProvider.user?.name ?? 'User',
                                style: AppText.heading4
                                    .copyWith(fontWeight: FontWeight.w800)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.notification);
                          },
                          child: Stack(
                            children: [
                              SvgPicture.asset(AppIcons.ic_bell, height: 20),
                              Positioned(
                                  top: 0,
                                  right: 2,
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        border: Border.all(
                                            color: AppColors.white, width: 1)),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  const SliverToBoxAdapter(child: BannerHome()),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: DailyAction(
                    title: 'Today Target',
                    textAction: 'Check',
                    onPressed: () async {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.activity_tracker);
                    },
                  )),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: TitleSection(
                    title: 'What Do You Want to Train',
                  )),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                        height: 140,
                        child: FutureBuilder(
                          future: workoutData,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final workoutItem = snapshot.data![index];
                                return WorkoutCard(
                                  workout: workoutItem,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 20,
                                );
                              },
                              itemCount: snapshot.data!.length,
                            );
                          },
                        )),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: TitleSection(title: 'Latest Workout')),
                  SliverList.separated(
                    itemCount: user?.workouts?.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      if (index < (user?.workouts?.length ?? 0)) {
                        final lastWorkout = user?.workouts![index];
                        return LastedWorkoutCard(
                          lastWorkout: lastWorkout,
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
