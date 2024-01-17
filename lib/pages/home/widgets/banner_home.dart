import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:fitness_app/utils/auth.dart';
import 'package:flutter/material.dart';

class BannerHome extends StatelessWidget {
  final double bmi;
  final String status;
  const BannerHome({super.key, required this.bmi, required this.status});

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      padding: AppStyles.paddingCard,
      decoration: const BoxDecoration(
          borderRadius: AppStyles.borderRadiusCard,
          gradient: AppColors.primaryGradiant),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI',
                style: AppText.medium.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                'You have a $status weight',
                style: AppText.small.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Button(
                text: 'View More',
                size: Size.medium,
                color: AppColors.secondaryGradiant,
                onPressed: () async {
                  await auth.clearSP();
                  Navigator.of(context).pushNamed(AppRoutes.splash);
                },
              )
            ],
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widthScreen * 0.25,
                  height: widthScreen * 0.25,
                  decoration: const BoxDecoration(
                      color: AppColors.white, shape: BoxShape.circle),
                ),
              ),
              Container(
                width: widthScreen * 0.15,
                height: widthScreen * 0.15,
                decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100))),
              ),
              Positioned(
                  top: 22,
                  right: 22,
                  child: Text(
                    bmi.toString(),
                    style: AppText.medium.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w600),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
