import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/dataExample/workout_data.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pages/home/widgets/banner_home.dart';
import 'package:fitness_app/pages/home/widgets/lasted_workout_card.dart';
import 'package:fitness_app/pages/home/widgets/workout_card.dart';
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
  WorkoutService workoutService = WorkoutService();
  void initState() {
    super.initState();
    workoutData = workoutService.getAllWorkout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              bottom: AppStyles.heightBottomNavigation,
              right: AppStyles.paddingBothSidesPage,
              left: AppStyles.paddingBothSidesPage),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Welcome Back,',
                            style: AppText.small
                                .copyWith(color: AppColors.gray_2)),
                        Text('Cao Nam',
                            style: AppText.heading4
                                .copyWith(fontWeight: FontWeight.w800)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.notification);
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
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(child: const BannerHome()),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                  child: DailyAction(
                title: 'Today Target',
                textAction: 'Check',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.activity_tracker);
                },
              )),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 15,
                ),
              ),
              SliverToBoxAdapter(
                  child: TitleSection(
                title: 'What Do You Want to Train',
              )),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    height: 140,
                    child: FutureBuilder(
                      future: workoutData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('No workout data available.');
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
                            return SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: snapshot.data!.length,
                        );
                      },
                    )),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(child: TitleSection(title: 'Latest Workout')),
              SliverList.separated(
                itemCount: listLastWorkout.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  final lastWorkout = listLastWorkout[index];
                  return LastedWorkoutCard(
                    lastWorkout: lastWorkout,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LastWorkout {
  String title;
  String desc;
  double progress;
  String image;

  LastWorkout(
      {required this.title,
      required this.desc,
      required this.image,
      required this.progress});
}

List<LastWorkout> listLastWorkout = [
  LastWorkout(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      progress: 0.3,
      title: 'Fullbody Workout'),
  LastWorkout(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      progress: 0.5,
      title: 'Lowerbody Workout'),
  LastWorkout(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      progress: 0.4,
      title: 'Lowerbody Workout'),
  LastWorkout(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      progress: 0.2,
      title: 'Lowerbody Workout'),
  LastWorkout(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      progress: 0.1,
      title: 'Lowerbody Workout')
];
