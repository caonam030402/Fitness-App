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
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      InputText(
                          controller: _emailController,
                          lable: 'Email',
                          icon: AppIcons.ic_message,
                          validator: (value) {
                            return RulesValidator.validatorEmail(value);
                          },
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      InputText(
                        controller: _passwordController,
                        hiddenValue: true,
                        validator: (value) {
                          return RulesValidator.validatorPassword(value);
                        },
                        lable: 'Password',
                        icon: AppIcons.ic_lock,
                      ),
                    ],
                  )),
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
                    if (_formKey.currentState!.validate()) {
                      authService.login(
                        context: context,
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
