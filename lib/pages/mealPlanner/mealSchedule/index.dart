import 'package:fitness_app/components/date.dart';
import 'package:fitness_app/components/title_item.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/mealPlanner/mealSchedule/widgets/button_month.dart';
import 'package:fitness_app/pages/mealPlanner/mealSchedule/widgets/meals_card.dart';
import 'package:fitness_app/pages/mealPlanner/mealSchedule/widgets/nutrition_card.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class MealSchedule extends StatelessWidget {
  const MealSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: 'Meal Schedule', isBackHome: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.paddingBothSidesPage),
          child: Column(
            children: [
              ButtonMonth(),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dateItem.length,
                  itemBuilder: (context, index) {
                    final item = dateItem[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Date(
                        label: item.label,
                        date: item.date,
                        isDateNow: item.isDateNow,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TitleItem(
                title: 'Breakfast',
                label: '${mealsCardItem.length} meals | 230 calories',
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 75 * mealsCardItem.length.toDouble(),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = mealsCardItem[index];
                      return MealsCard(
                          color: index % 2 == 0
                              ? AppColors.primary.withOpacity(0.4)
                              : AppColors.secondary.withOpacity(0.4),
                          title: item.title,
                          label: item.label,
                          icon: item.icon);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: mealsCardItem.length),
              ),
              SizedBox(
                height: 15,
              ),
              TitleItem(
                title: 'Lunch',
                label: '${mealsCardItem.length} meals | 230 calories',
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 75 * mealsCardItem.length.toDouble(),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = mealsCardItem[index];
                      return MealsCard(
                          color: index % 2 == 0
                              ? AppColors.primary.withOpacity(0.4)
                              : AppColors.secondary.withOpacity(0.4),
                          title: item.title,
                          label: item.label,
                          icon: item.icon);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: mealsCardItem.length),
              ),
              SizedBox(
                height: 15,
              ),
              TitleItem(
                title: 'Snacks',
                label: '${mealsCardItem.length} meals | 230 calories',
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 75 * mealsCardItem.length.toDouble(),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = mealsCardItem[index];
                      return MealsCard(
                          color: index % 2 == 0
                              ? AppColors.primary.withOpacity(0.4)
                              : AppColors.secondary.withOpacity(0.4),
                          title: item.title,
                          label: item.label,
                          icon: item.icon);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: mealsCardItem.length),
              ),
              SizedBox(
                height: 15,
              ),
              TitleItem(
                title: 'Dinner',
                label: '${mealsCardItem.length} meals | 230 calories',
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 75 * mealsCardItem.length.toDouble(),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = mealsCardItem[index];
                      return MealsCard(
                          color: index % 2 == 0
                              ? AppColors.primary.withOpacity(0.4)
                              : AppColors.secondary.withOpacity(0.4),
                          title: item.title,
                          label: item.label,
                          icon: item.icon);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: mealsCardItem.length),
              ),
              SizedBox(
                height: 15,
              ),
              TitleSection(
                title: 'Today Meal Nutritions',
                hiddenAction: true,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 78 * nutritionCardItem.length.toDouble(),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = nutritionCardItem[index];
                      return NutritionCard(
                          percent: item.percent,
                          title: item.title,
                          label: item.label,
                          icon: item.icon);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: nutritionCardItem.length),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NutritionCardItem {
  String title;
  String label;
  String icon;
  double percent;

  NutritionCardItem({
    required this.title,
    required this.label,
    required this.icon,
    required this.percent,
  });
}

List<NutritionCardItem> nutritionCardItem = [
  NutritionCardItem(
    title: "Calories",
    label: '320 kCal',
    icon: AppIcons.ic_fire,
    percent: 0.8,
  ),
  NutritionCardItem(
    title: "Calories",
    label: '320 kCal',
    icon: AppIcons.ic_fire,
    percent: 0.6,
  ),
];

class MealsCardItem {
  String title;
  String label;
  String icon;

  MealsCardItem({
    required this.title,
    required this.label,
    required this.icon,
  });
}

List<MealsCardItem> mealsCardItem = [
  MealsCardItem(
    title: "Honey Pancake",
    label: '07:00am',
    icon: AppIcons.vt_cake_1,
  ),
  MealsCardItem(
    title: "Honey Pancake",
    label: '07:00am',
    icon: AppIcons.vt_cake_1,
  ),
];

class DateItem {
  String date;
  String label;
  bool isDateNow;

  DateItem({required this.date, required this.label, this.isDateNow = false});
}

List<DateItem> dateItem = [
  DateItem(
    date: '11',
    label: 'Tue',
  ),
  DateItem(
    date: '12',
    label: 'Wed',
  ),
  DateItem(
    date: '13',
    label: 'Thus',
  ),
  DateItem(
    date: '14',
    label: 'Fri',
    isDateNow: true,
  ),
  DateItem(
    date: '15',
    label: 'Sat',
  ),
  DateItem(
    date: '16',
    label: 'Sun',
  ),
];
