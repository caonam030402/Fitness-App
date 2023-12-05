import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/dashboard/home/widgets/banner_home.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Welcome Back,',
                          style:
                              AppText.small.copyWith(color: AppColors.gray_2)),
                      Text('Cao Nam',
                          style: AppText.heading4
                              .copyWith(fontWeight: FontWeight.w800)),
                    ],
                  ),
                  Stack(
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
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const BannerHome()
            ],
          ),
        ),
      ),
    );
  }
}
