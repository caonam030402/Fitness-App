import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/input_text.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/loginAndRegister/components/button_icon.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
        return true;
      },
      child: Scaffold(
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
                          'Create an Account',
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
                  lable: 'First Name',
                  icon: AppIcons.ic_profile,
                ),
                const SizedBox(
                  height: 17,
                ),
                const InputText(
                  lable: 'Last Name',
                  icon: AppIcons.ic_profile,
                ),
                const SizedBox(
                  height: 17,
                ),
                const InputText(
                  lable: 'Email',
                  icon: AppIcons.ic_message,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 17,
                ),
                const InputText(
                  hiddenValue: true,
                  lable: 'Password',
                  icon: AppIcons.ic_lock,
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: AppColors.gray_2,
                        fillColor: MaterialStateProperty.all(AppColors.white),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Container(
                      width: 244,
                      child: Text(
                        'By continuing you accept our Privacy Policy and Term of Use',
                        style: AppText.caption.copyWith(
                            color: AppColors.gray_2,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Button(
                    text: 'Register',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.information);
                    }),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Expanded(
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
                      const Expanded(
                        child: Divider(thickness: 1, color: AppColors.gray_3),
                      ),
                    ],
                  ),
                ),
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
                ),
                const Spacer(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
