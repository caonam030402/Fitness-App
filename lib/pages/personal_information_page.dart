import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/input_date.dart';
import 'package:fitness_app/components/input_text.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: SvgPicture.asset(AppIcons.sp_shape_3)),
                    Positioned(
                        right: 0,
                        left: 0,
                        child:
                            SvgPicture.asset(AppIcons.vt_light_weight_training))
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
                    height: 10,
                  ),
                  Text('Let’s complete your profile',
                      style: AppText.heading4.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.black)),
                  Text('It will help us to know more about you!',
                      style: AppText.small.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray_1)),
                  SizedBox(
                    height: 30,
                  ),
                  InputText(
                      lable: 'Choose Gender', icon: AppIcons.ic_two_person),
                  SizedBox(
                    height: 17,
                  ),
                  InputDate(
                    label: 'Date of Birth',
                    icon: AppIcons.ic_calendar,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: [
                      InputText(
                        lable: 'Your Weight',
                        icon: AppIcons.ic_weight_scale,
                          keyboardType: TextInputType.number,
                        containerWidth: true,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: AppColors.secondaryGradiant),
                        child: Center(
                            child: Text('KG',
                                style: AppText.small.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: [
                      InputText(
                          lable: 'Your Height',
                          icon: AppIcons.ic_swap,
                          keyboardType: TextInputType.number,
                          containerWidth: true),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: AppColors.secondaryGradiant),
                        child: Center(
                            child: Text('CM',
                                style: AppText.small.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Button(
                      text: 'Next',
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.intro);
                      }),
                  SizedBox(
                    height: AppStyles.PaddingBothSidesPage,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
