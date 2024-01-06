import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/pages/mealPlanner/breakfast/widgets/category_card.dart';
import 'package:fitness_app/pages/mealPlanner/breakfast/widgets/food_card.dart';
import 'package:fitness_app/pages/mealPlanner/breakfast/widgets/popular_card.dart';
import 'package:fitness_app/pages/mealPlanner/breakfast/widgets/search.dart';
import 'package:fitness_app/services/meal_services.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class Breakfast extends StatelessWidget {
  const Breakfast({super.key});

  @override
  Widget build(BuildContext context) {
    final TimeOfDays data =
        ModalRoute.of(context)!.settings.arguments as TimeOfDays;

    MealService mealService = MealService();

    return Scaffold(
      appBar: ToolBar(title: data.name),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.paddingBothSidesPage),
            child: Column(
              children: [
                const Search(),
                const SizedBox(
                  height: 15,
                ),
                const TitleSection(
                  title: 'Category',
                  hiddenAction: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = categoryCardItem[index];
                        return CategoryCard(
                          icon: item.icon,
                          label: item.label,
                          color: index % 2 == 0
                              ? AppColors.primary.withOpacity(0.2)
                              : AppColors.secondary.withOpacity(0.2),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 15);
                      },
                      itemCount: categoryCardItem.length),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TitleSection(
                  title: 'Recommendation for Diet',
                  hiddenAction: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    final meal = mealService.getCategories();
                    print(meal);
                  },
                  child: SizedBox(
                    height: 240,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final item = foodCardItem[index];
                          return FoodCard(
                            icon: item.icon,
                            label: item.label,
                            title: item.title,
                            color: index % 2 == 0
                                ? AppColors.primary.withOpacity(0.2)
                                : AppColors.secondary.withOpacity(0.2),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 15);
                        },
                        itemCount: foodCardItem.length),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TitleSection(
                  title: 'Popular',
                  hiddenAction: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: (80 + 15) * popularCardItem.length.toDouble(),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = popularCardItem[index];
                        return PopularCard(
                          icon: item.icon,
                          label: item.label,
                          title: item.title,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.mealDetails);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 15);
                      },
                      itemCount: popularCardItem.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCardItem {
  String icon;
  String label;
  CategoryCardItem({required this.icon, required this.label});
}

List<CategoryCardItem> categoryCardItem = [
  CategoryCardItem(
    icon: AppIcons.vt_cake,
    label: 'Salad',
  ),
  CategoryCardItem(
    icon: AppIcons.vt_salat,
    label: 'Salad',
  ),
  CategoryCardItem(
    icon: AppIcons.vt_salat,
    label: 'Salad',
  ),
  CategoryCardItem(
    icon: AppIcons.vt_salat,
    label: 'Salad',
  ),
  CategoryCardItem(
    icon: AppIcons.vt_salat,
    label: 'Salad',
  ),
  CategoryCardItem(
    icon: AppIcons.vt_salat,
    label: 'Salad',
  ),
  CategoryCardItem(
    icon: AppIcons.vt_salat,
    label: 'Salad',
  ),
];

class PopularCardItem {
  String icon;
  String label;
  String title;
  PopularCardItem(
      {required this.icon, required this.label, required this.title});
}

List<PopularCardItem> popularCardItem = [
  PopularCardItem(
    icon: AppIcons.vt_cake,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  PopularCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  PopularCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
];

class FoodCardItem {
  String icon;
  String label;
  String title;
  FoodCardItem({required this.icon, required this.label, required this.title});
}

List<FoodCardItem> foodCardItem = [
  FoodCardItem(
    icon: AppIcons.vt_cake,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  FoodCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  FoodCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  FoodCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  FoodCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  FoodCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
  FoodCardItem(
    icon: AppIcons.vt_cake_1,
    title: 'Honey Pancake',
    label: 'Easy | 30mins | 180kCal',
  ),
];
