import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerBig extends StatelessWidget {
  final String icon;
  final String text;
  final String? content;
  final String contentColor;
  const BannerBig(
      {super.key,
      this.content,
      required this.contentColor,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137,
      width: MediaQuery.of(context).size.width - AppStyles.paddingBothSidesPage,
      padding: AppStyles.paddingCard,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: AppColors.primary.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: AppText.small.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          height: 1.8),
                    ),
                    RichText(
                      text: TextSpan(
                        text: content,
                        style: AppText.small.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                        children: [
                          TextSpan(
                              text: contentColor,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Button(
                text: 'Learn More',
                onPressed: () {},
                size: Size.medium,
              )
            ],
          ),
          SvgPicture.asset(icon)
        ],
      ),
    );
  }
}
