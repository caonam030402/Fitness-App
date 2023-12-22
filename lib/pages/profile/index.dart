import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/title_section.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/profile/widgets/account_section.dart';
import 'package:fitness_app/pages/profile/widgets/personal_card.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: "Profile", isBackHome: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: AppStyles.paddingBothSidesPage,
              right: AppStyles.paddingBothSidesPage,
              left: AppStyles.paddingBothSidesPage),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primary),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cao Nam',
                        style: AppText.medium
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Lose a Fat Program',
                        style: AppText.small.copyWith(color: AppColors.gray_1),
                      )
                    ],
                  ),
                  const Spacer(),
                  Button(
                    text: 'Edit',
                    size: Size.medium,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  PersonalCard(title: '180cm', desc: 'Height'),
                  SizedBox(
                    width: 15,
                  ),
                  PersonalCard(
                    title: '65kg',
                    desc: 'Weight',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  PersonalCard(title: '22yo', desc: 'Age'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [AppShadows.shadowCard]),
                child: Column(
                  children: [
                    Padding(
                      padding: AppStyles.paddingCard,
                      child: Column(
                        children: [
                          const TitleSection(
                            title: 'Account',
                            hiddenAction: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_profile_blue,
                              label: 'Personal Data',
                              onTap: () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_achievement_blue,
                              label: 'Achievement',
                              onTap: () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_activity_blue,
                              label: 'Activity History',
                              onTap: () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_workout_blue,
                              label: 'Workout Progress',
                              onTap: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [AppShadows.shadowCard]),
                child: Column(
                  children: [
                    Padding(
                      padding: AppStyles.paddingCard,
                      child: Column(
                        children: [
                          const TitleSection(
                            title: 'Notification',
                            hiddenAction: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_notification_blue,
                              label: 'Pop-up Notification',
                              isToggle: true,
                              onTap: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [AppShadows.shadowCard]),
                child: Column(
                  children: [
                    Padding(
                      padding: AppStyles.paddingCard,
                      child: Column(
                        children: [
                          const TitleSection(
                            title: 'Other',
                            hiddenAction: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_message_blue,
                              label: 'Contact Us',
                              onTap: () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_privacy_blue,
                              label: 'Privacy Policy',
                              onTap: () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountSection(
                              icon: AppIcons.ic_setting_blue,
                              label: 'Settings',
                              onTap: () {}),
                        ],
                      ),
                    )
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
