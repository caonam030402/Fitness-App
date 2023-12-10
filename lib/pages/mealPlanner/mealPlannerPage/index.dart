import 'package:fitness_app/components/daily_action.dart';
import 'package:fitness_app/pages/mealPlanner/mealPlannerPage/widgets/breakfast_card.dart';
import 'package:fitness_app/pages/mealPlanner/mealPlannerPage/widgets/graph_section.dart';
import 'package:fitness_app/pages/mealPlanner/mealPlannerPage/widgets/meal_card.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class MealPlannerPage extends StatelessWidget {
  const MealPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: 'Meal Planner'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.paddingBothSidesPage),
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
            const DailyAction(
              textAction: 'Check',
              title: 'Daily Meal Schedule',
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
                  itemCount: breakfastCardItem.length,
                  itemBuilder: (context, index) {
                    final item = breakfastCardItem[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: BreakfastCard(
                        content: item.content,
                        title: item.title,
                        label: item.label,
                        isColorSecondary: item.isColorSecondary,
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class BreakfastCardItem {
  String content;
  String title;
  String label;
  bool isColorSecondary;
  BreakfastCardItem(
      {required this.content,
      required this.title,
      required this.label,
      this.isColorSecondary = false});
}

List<BreakfastCardItem> breakfastCardItem = [
  BreakfastCardItem(content: '120+ Foods', title: 'Breakfast', label: 'Select'),
  BreakfastCardItem(
      content: '120+ Foods',
      title: 'Breakfast',
      label: 'Select',
      isColorSecondary: true),
];

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
