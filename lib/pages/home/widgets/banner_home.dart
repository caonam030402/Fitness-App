import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      padding: AppStyles.paddingCard,
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
                'You have a normal weight',
                style: AppText.small.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Button(
                text: 'View More',
                size: Size.medium,
                color: AppColors.secondaryGradiant,
                onPressed: () {},
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
                  decoration: BoxDecoration(
                      color: AppColors.white, shape: BoxShape.circle),
                ),
              ),
              Container(
                width: widthScreen * 0.15,
                height: widthScreen * 0.15,
                decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100))),
              ),
              Positioned(
                  top: 22,
                  right: 22,
                  child: Text(
                    '25,1',
                    style: AppText.medium.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w600),
                  ))
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: AppStyles.borderRadiusCard,
          gradient: AppColors.primaryGradiant),
    );
  }
}
