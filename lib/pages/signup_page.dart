import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/input_text_with_title.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.PaddingBothSidesPage),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Hey there,',
                        style: AppText.large.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400)),
                    Text(
                      'Create an Account',
                      style: AppText.heading4.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InputTextWithTitle(
              title: 'First Name',
              icon: AppIcons.ic_profile,
            ),
            SizedBox(
              height: 17,
            ),
            InputTextWithTitle(
              title: 'Last Name',
              icon: AppIcons.ic_profile,
            ),
            SizedBox(
              height: 17,
            ),
            InputTextWithTitle(
              title: 'Email',
              icon: AppIcons.ic_message,
            ),
            SizedBox(
              height: 17,
            ),
            InputTextWithTitle(
              title: 'Password',
              icon: AppIcons.ic_lock,
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Container(
                  width: 244,
                  child: Text(
                    'By continuing you accept our Privacy Policy and Term of Use',
                    style: AppText.caption.copyWith(
                        color: AppColors.gray_2, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Button(
                text: 'Register',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                }),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: AppColors.gray_3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Or',
                      style: AppText.small.copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.black),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: AppColors.gray_3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 0.8, color: AppColors.gray_3)),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.white,
                      shadowColor: Colors.transparent,
                    ),
                    child: SvgPicture.asset(AppIcons.ic_google),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 0.8, color: AppColors.gray_3)),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.white,
                      shadowColor: Colors.transparent,
                    ),
                    child: SvgPicture.asset(AppIcons.ic_facebook),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: AppText.medium.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.login);
                  },
                  child: Text(
                    'Login',
                    style: AppText.medium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    ));
  }
}
