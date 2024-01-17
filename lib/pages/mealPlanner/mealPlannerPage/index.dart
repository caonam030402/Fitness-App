import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/pages/mealPlanner/breakfast/index.dart';
import 'package:fitness_app/pages/mealPlanner/mealPlannerPage/widgets/breakfast_card.dart';
import 'package:fitness_app/pages/mealPlanner/mealPlannerPage/widgets/graph_section.dart';
import 'package:fitness_app/pages/mealPlanner/mealPlannerPage/widgets/meal_card.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/services/meal_services.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({super.key});

  @override
  State<MealPlannerPage> createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> {
  late Future<List<TimeOfDays>> listTimeOfDay;
  MealService mealService = MealService();

  @override
  void initState() {
    super.initState();
    listTimeOfDay = mealService.getTimeOfDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: 'Meal Planner'),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: listTimeOfDay,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(
                left: AppStyles.paddingBothSidesPage,
                right: AppStyles.paddingBothSidesPage,
                bottom: AppStyles.heightBottomNavigation * 2),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const TitleSection(
                  title: 'Meal Nutritions',
                  typeAction: TypeAction.select,
                ),
                const GraphSection(),
                const SizedBox(
                  height: 15,
                ),
                DailyAction(
                  textAction: 'Check',
                  title: 'Daily Meal Schedule',
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.mealSchedule);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const TitleSection(
                  title: 'Today Meals',
                  typeAction: TypeAction.select,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 108 * mealCardItem.length.toDouble(),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mealCardItem.length,
                      itemBuilder: (context, index) {
                        final item = mealCardItem[index];
                        return MealCard(
                          icon: item.icon,
                          title: item.title,
                          label: item.label,
                        );
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TitleSection(
                  title: 'Find Something to Eat',
                  hiddenAction: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final timeOfDay = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: BreakfastCard(
                            image: timeOfDay.image,
                            content: '120+ Foods',
                            title: timeOfDay.name,
                            isColorSecondary: index % 2 != 0,
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.breakfast,
                                  arguments: timeOfDay);
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}

class MealCardItem {
  String icon;
  String title;
  String label;
  MealCardItem({required this.icon, required this.title, required this.label});
}

List<MealCardItem> mealCardItem = [
  MealCardItem(
      icon: AppIcons.vt_sushi, title: 'Salmon Nigiri', label: 'Today | 7am'),
  MealCardItem(
      icon: AppIcons.vt_glass, title: 'Lowfat Milk', label: 'Today | 8am'),
];
