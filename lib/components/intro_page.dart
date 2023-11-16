import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/onboarding/onboarding_page.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage extends StatelessWidget {
  final String title;
  final String desc;
  final int indexPage;
  final controller;
  final Widget image;

  const IntroPage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.controller,
    required this.indexPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: image),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.paddingBothSidesPage),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.heading2.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  desc,
                  style: AppText.medium.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.gray_1),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton.large(
        focusElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                color: AppColors.primary,
                value: indexPage * (1 / listIntroPageItem.length),
                strokeWidth: 2,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              left: 5,
              bottom: 5,
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradiant,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: SvgPicture.asset(
                  AppIcons.ic_arrow_right,
                  width: 10,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          if (listIntroPageItem.length == indexPage) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.register);
          }
          if (controller.hasClients) {
            controller.jumpToPage(
              indexPage,
            );
          }
        },
      ),
    );
  }
}
