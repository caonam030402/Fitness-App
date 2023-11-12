import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SvgPicture.asset(AppIcons.sp_shape_2)),
                      Positioned(
                          left: 35,
                          bottom: 0,
                          child: SvgPicture.asset(AppIcons.vt_man_1)),
                      Positioned(
                          right: 50,
                          bottom: 0,
                          child: SvgPicture.asset(AppIcons.vt_lady)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.PaddingBothSidesPage),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text('Welcome, Stefani',
                        style: AppText.heading4.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 230,
                      child: Text(
                        'You are all set now, let’s reach your goals together with us',
                        style: AppText.small.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_1),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(AppStyles.PaddingBothSidesPage),
              child: Button(
                  text: 'Go To Home',
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.main);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
