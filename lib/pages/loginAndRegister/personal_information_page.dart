import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/input_date.dart';
import 'package:fitness_app/components/input_text.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/services/user_services.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:fitness_app/utils/rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final UserService userService = UserService();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: SvgPicture.asset(AppIcons.sp_shape_3)),
                      Positioned(
                          right: 0,
                          left: 0,
                          child: SvgPicture.asset(
                              AppIcons.vt_light_weight_training))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.paddingBothSidesPage),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Let’s complete your profile',
                        style: AppText.heading4.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black)),
                    Text('It will help us to know more about you!',
                        style: AppText.small.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_1)),
                    const SizedBox(
                      height: 25,
                    ),
                    const InputText(
                        lable: 'Choose Gender', icon: AppIcons.ic_two_person),
                    const SizedBox(
                      height: 17,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputDate(
                              controller: _dateOfBirthController,
                              validator: (value) {
                                return Rules.isRequired(value);
                              },
                              label: 'Date of Birth',
                              icon: AppIcons.ic_calendar,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InputText(
                                  controller: _weightController,
                                  validator: (value) {
                                    return RulesValidator.validatorWeight(
                                        value);
                                  },
                                  lable: 'Your Weight',
                                  icon: AppIcons.ic_weight_scale,
                                  keyboardType: TextInputType.number,
                                  containerWidth: true,
                                ),
                                const SizedBox(
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
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InputText(
                                    controller: _heightController,
                                    validator: (value) {
                                      return RulesValidator.validatorHeight(
                                          value);
                                    },
                                    lable: 'Your Height',
                                    icon: AppIcons.ic_swap,
                                    keyboardType: TextInputType.number,
                                    containerWidth: true),
                                const SizedBox(
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
                            const SizedBox(
                              height: 25,
                            ),
                            Button(
                                text: 'Next',
                                onPressed: () {
                                  print(_dateOfBirthController.text.toString());
                                  if (_formKey.currentState!.validate()) {
                                    userService.updateUser(
                                        body: User(
                                            height: int.parse(
                                                _heightController.text),
                                            weight: int.parse(
                                                _weightController.text),
                                            dateOfBirth: _dateOfBirthController
                                                .text
                                                .toString()),
                                        context: context);
                                  }
                                }),
                          ],
                        )),
                    const SizedBox(
                      height: AppStyles.paddingBothSidesPage,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
