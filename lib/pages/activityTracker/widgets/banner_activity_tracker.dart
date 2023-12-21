import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerActivityTracker extends StatelessWidget {
  const BannerActivityTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.paddingCard,
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.2),
          borderRadius: AppStyles.borderRadiusCard),
      child: Column(children: [
        Row(
          children: [
            Text(
              'Today Target',
              style: AppText.medium.copyWith(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(4),
              child: SvgPicture.asset(AppIcons.ic_plus),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  gradient: AppColors.primaryGradiant,
                  borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Row(
          children: [
            TargetCard(
                desc: 'Water Intake', image: AppIcons.im_glass, title: '8L'),
            SizedBox(
              width: 15,
            ),
            TargetCard(
                desc: 'Foot Steps', image: AppIcons.im_boots, title: '2400')
          ],
        )
      ]),
    );
  }
}

class TargetCard extends StatelessWidget {
  final title;
  final desc;
  final image;
  const TargetCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: AppStyles.borderRadiusCard),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.medium.copyWith(color: AppColors.primary),
                ),
                Text(
                  desc,
                  style: AppText.small.copyWith(color: AppColors.gray_1),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
