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
import 'package:shared_preferences/shared_preferences.dart';

class Breakfast extends StatefulWidget {
  const Breakfast({super.key});

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  late String userId = '';

  @override
  void initState() {
    super.initState();
    _loadStoredValue();
  }

  _loadStoredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('user-id') ?? '';

    setState(() {
      userId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TimeOfDays data =
        ModalRoute.of(context)!.settings.arguments as TimeOfDays;

    MealService mealService = MealService();

    return Scaffold(
      appBar: ToolBar(title: data.name),
      body: FutureBuilder(
        future: Future.wait([
          mealService.getCategories(),
          mealService.getAllMeal(field: 'popular'),
          mealService.getAllMeal(field: 'recommend', idUser: userId),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            ); // Đang tải dữ liệu
          }

          final dataCategory = snapshot.data![0] as List<Category>;
          final dataCategoryPopular = snapshot.data![1] as List<Meal>;
          final dataMealRecommend = snapshot.data![2] as List<Meal>;

          return Padding(
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
                            final dataCategoryItem = dataCategory[index];

                            return CategoryCard(
                              image: dataCategoryItem.image,
                              label: dataCategoryItem.name,
                              color: index % 2 == 0
                                  ? AppColors.primary.withOpacity(0.2)
                                  : AppColors.secondary.withOpacity(0.2),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 15);
                          },
                          itemCount: dataCategory.length),
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
                      },
                      child: SizedBox(
                        height: 240,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = dataMealRecommend[index];
                              return FoodCard(
                                icon: item.image,
                                label:
                                    '${item.calories}k Cal | ${item.forTheBody}',
                                title: item.name,
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
                      height: (80 + 15) * dataCategoryPopular.length.toDouble(),
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = dataCategoryPopular[index];
                            return PopularCard(
                              image: item.image,
                              label:
                                  '${item.calories}kCal | ${item.forTheBody}',
                              title: item.name,
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.mealDetails,
                                    arguments: item);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15);
                          },
                          itemCount: dataCategoryPopular.length),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
