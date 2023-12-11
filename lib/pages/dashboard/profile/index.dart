import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/pages/dashboard/profile/widgets/personal_card.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: "Profile"),
      body: Padding(
        padding: EdgeInsets.only(
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
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primary),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cao Nam',
                      style:
                          AppText.medium.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Lose a Fat Program',
                      style: AppText.small.copyWith(color: AppColors.gray_1),
                    )
                  ],
                ),
                Spacer(),
                Button(
                  text: 'Edit',
                  size: Size.medium,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
