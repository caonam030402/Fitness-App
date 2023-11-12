import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/input_text.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                height: 70,
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
                        'Welcome Back',
                        style: AppText.heading4.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InputText(
                  lable: 'Email',
                  icon: AppIcons.ic_message,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 17,
              ),
              InputText(
                hiddenValue: true,
                lable: 'Password',
                icon: AppIcons.ic_lock,
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.main);
                    },
                    child: Container(
                      width: 160,
                      child: Text(
                        'Forgot your password?',
                        style: AppText.small.copyWith(
                            color: AppColors.gray_2,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Button(
                  text: 'Login',
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.wellcome);
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
                            fontWeight: FontWeight.w400,
                            color: AppColors.black),
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
                        border:
                            Border.all(width: 0.8, color: AppColors.gray_3)),
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
                        border:
                            Border.all(width: 0.8, color: AppColors.gray_3)),
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
                    'Don’t have an account yet?',
                    style: AppText.medium.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.register);
                    },
                    child: Text(
                      'Register',
                      style: AppText.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondary),
                    ),
                  )
                ],
              ),
              Spacer()
            ],
          ),
        ),
      )),
    );
  }
}
