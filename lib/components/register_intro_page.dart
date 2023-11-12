import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/list_register_intro_page.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterIntroPage extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final int indexPage;
  final controller;
  const RegisterIntroPage(
      {super.key,
      required this.title,
      required this.desc,
      required this.indexPage,
      required this.image,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.PaddingBothSidesPage),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text('What is your goal ?',
                  style: AppText.heading4.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.black)),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 200,
                  child: Text(
                      'It will help us to choose a best program for you',
                      style: AppText.small.copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.gray_1),
                      textAlign: TextAlign.center)),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 478,
                    width: 275,
                    decoration: BoxDecoration(
                        gradient: AppColors.primaryGradiant,
                        borderRadius: BorderRadius.circular(22)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        SvgPicture.asset(image),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(title,
                                style: AppText.medium.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white),
                                textAlign: TextAlign.center),
                            Divider(
                              height: 4,
                              thickness: 1,
                              indent: 110,
                              endIndent: 110,
                              color: AppColors.border,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 210,
                              child: Text(desc,
                                  style: AppText.small.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white),
                                  textAlign: TextAlign.center),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Button(
                  text: 'Confirm',
                  onPressed: () {
                    if (indexPage == listRegisterIntroItem.length) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.register);
                    }
                    if (controller.hasClients) {
                      controller.jumpToPage(
                        indexPage,
                      );
                    }
                    ;
                  }),
              SizedBox(
                height: AppStyles.PaddingBothSidesPage,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
