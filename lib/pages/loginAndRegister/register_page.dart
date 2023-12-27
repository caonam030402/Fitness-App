import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/input_text.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/services/auth_services.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:fitness_app/utils/rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String? valuePassword;

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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputText(
                          controller: _nameController,
                          lable: 'Name',
                          icon: AppIcons.ic_profile,
                          validator: (value) {
                            return RulesValidator.validatorName(value);
                          },
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        InputText(
                          controller: _emailController,
                          validator: (value) {
                            return RulesValidator.validatorEmail(value);
                          },
                          lable: 'Email',
                          icon: AppIcons.ic_message,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        InputText(
                          controller: _passwordController,
                          onChanged: (value) => {
                            setState(() {
                              valuePassword = value;
                            })
                          },
                          hiddenValue: true,
                          lable: 'Password',
                          icon: AppIcons.ic_lock,
                          validator: (value) {
                            return RulesValidator.validatorPassword(value);
                          },
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        InputText(
                          validator: (value) {
                            return RulesValidator.validatorConfirmPassword(
                                value, valuePassword);
                          },
                          hiddenValue: true,
                          lable: 'Confirm Password',
                          icon: AppIcons.ic_lock,
                        ),
                      ],
                    )),
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
                    SizedBox(
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
                      if (_formKey.currentState!.validate()) {
                        authService.register(
                          context: context,
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
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
                    const SizedBox(
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
