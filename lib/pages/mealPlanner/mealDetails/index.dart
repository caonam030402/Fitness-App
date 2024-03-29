import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:fitness_app/pages/mealPlanner/mealDetails/widgets/custom_step.dart';
import 'package:fitness_app/pages/mealPlanner/mealDetails/widgets/ingredients_card.dart';
import 'package:fitness_app/pages/mealPlanner/mealDetails/widgets/nutriotions_card.dart';
import 'package:fitness_app/components/title_item.dart';
import 'package:fitness_app/services/meal_services.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    MealService mealService = MealService();
    final Meal mealDetail = ModalRoute.of(context)!.settings.arguments as Meal;
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: 436,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 40),
                    decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradiant),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.8,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: AppColors.white.withOpacity(0.3)),
                          child: SvgPicture.network(
                            mealDetail.image,
                            height: 300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        child: const ToolBar(title: '')),
                  )
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.57,
                minChildSize: 0.57,
                builder: (context, controller) {
                  return SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppStyles.paddingBothSidesPage),
                        child: Column(
                          children: [
                            Container(
                                height: 5,
                                width: 50,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.black.withOpacity(0.3))),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mealDetail.name,
                                      style: AppText.large.copyWith(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w700,
                                          height: 2.4),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'by',
                                        style: AppText.small.copyWith(
                                            color: AppColors.gray_1,
                                            fontWeight: FontWeight.w400),
                                        children: [
                                          TextSpan(
                                              text: ' James Ruth',
                                              style: AppText.small.copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 32,
                                  width: 32,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: AppColors.border,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: SvgPicture.asset(AppIcons.ic_heart),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const TitleSection(
                              title: 'Nutrition',
                              hiddenAction: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 38,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final item = nutriotionsCardItem[index];
                                    return NutriotionsCard(
                                      label: item.label,
                                      icon: item.icon,
                                    );
                                  },
                                  separatorBuilder: (BuildContext, int) {
                                    return const SizedBox(
                                      width: 15,
                                    );
                                  },
                                  itemCount: nutriotionsCardItem.length),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const TitleSection(
                              title: 'Descriptions',
                              hiddenAction: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ReadMoreText(
                              mealDetail.descriptions,
                              trimLines: 2,
                              style: AppText.medium
                                  .copyWith(color: AppColors.gray_1),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              lessStyle: AppText.medium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold),
                              moreStyle: AppText.medium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TitleItem(
                                title: 'Ingredients That You Will Need',
                                label:
                                    '${ingredientsCardItem.length.toDouble().toInt()} items'),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final item = ingredientsCardItem[index];
                                    return IngredientsCard(
                                      icon: item.icon,
                                      label: item.label,
                                      text: item.text,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 15);
                                  },
                                  itemCount: ingredientsCardItem.length),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TitleItem(
                                title: 'Step by Step',
                                label:
                                    '${customStepItem.length.toDouble().toInt()} items'),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 100 * customStepItem.length.toDouble(),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemCount: customStepItem.length,
                                itemBuilder: (context, index) {
                                  final item = customStepItem[index];
                                  return CustomStep(
                                      number: index < 9
                                          ? '0${index + 1}'.toString()
                                          : (index + 1).toString(),
                                      step: ((index + 1)).toString(),
                                      isRead: item.isRead,
                                      content: item.content);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppStyles.paddingBothSidesPage),
            child: Button(
              text: 'Add to Breakfast Meal',
              onPressed: () {
                mealService.addMealPlannerForUser(mealDetail.id);
                // Navigator.of(context).pop();
              },
            ),
          ),
        )
      ],
    );
  }
}

class CustomStepItem {
  String content;
  bool isRead;
  CustomStepItem({required this.content, this.isRead = false});
}

List<CustomStepItem> customStepItem = [
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
    isRead: true,
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
  CustomStepItem(
    content: 'Prepare all of the ingredients that needed',
  ),
];

class IngredientsCardItem {
  String label;
  String text;
  String icon;
  IngredientsCardItem(
      {required this.label, required this.text, required this.icon});
}

List<IngredientsCardItem> ingredientsCardItem = [
  IngredientsCardItem(
    icon: AppIcons.vt_flour,
    label: 'Wheat Flour',
    text: '100gr',
  ),
  IngredientsCardItem(
    icon: AppIcons.vt_flour,
    label: 'Wheat Flour',
    text: '100gr',
  ),
  IngredientsCardItem(
    icon: AppIcons.vt_flour,
    label: 'Wheat Flour',
    text: '100gr',
  ),
  IngredientsCardItem(
    icon: AppIcons.vt_flour,
    label: 'Wheat Flour',
    text: '100gr',
  ),
  IngredientsCardItem(
    icon: AppIcons.vt_flour,
    label: 'Wheat Flour',
    text: '100gr',
  ),
  IngredientsCardItem(
    icon: AppIcons.vt_flour,
    label: 'Wheat Flour',
    text: '100gr',
  ),
  IngredientsCardItem(
    icon: AppIcons.vt_flour,
    label: 'Wheat Flour',
    text: '100gr',
  ),
];

class NutriotionsCardItem {
  String label;
  String icon;
  NutriotionsCardItem({required this.label, required this.icon});
}

List<NutriotionsCardItem> nutriotionsCardItem = [
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
  NutriotionsCardItem(
    icon: AppIcons.ic_fire,
    label: '180kCal',
  ),
];
