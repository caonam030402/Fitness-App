import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/input_text.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/loginAndRegister/components/border_or.dart';
import 'package:fitness_app/pages/loginAndRegister/components/button_icon.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

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
              horizontal: AppStyles.paddingBothSidesPage),
          child: Column(
            children: [
              const SizedBox(
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
              const SizedBox(
                height: 30,
              ),
              const InputText(
                  lable: 'Email',
                  icon: AppIcons.ic_message,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(
                height: 17,
              ),
              const InputText(
                hiddenValue: true,
                lable: 'Password',
                icon: AppIcons.ic_lock,
              ),
              const SizedBox(
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
                    child: SizedBox(
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
              const Spacer(),
              Button(
                  text: 'Login',
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.wellcome);
                  }),
              const SizedBox(
                height: 15,
              ),
              const BorderOr(),
              const SizedBox(
                height: 30,
              ),
              const ButtonIcon(),
              const SizedBox(
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
              const Spacer()
            ],
          ),
        ),
      )),
    );
  }
}
