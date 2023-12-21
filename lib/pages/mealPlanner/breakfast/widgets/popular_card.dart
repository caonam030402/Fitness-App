import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_shadows.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopularCard extends StatelessWidget {
  final String title;
  final String label;
  final String icon;
  final Function()? onPressed;
  const PopularCard(
      {super.key,
      required this.title,
      required this.label,
      required this.icon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(0),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              AppShadows.shadowCard,
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: SizedBox(
                        width: 45,
                        child: SvgPicture.asset(icon),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: AppText.medium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              height: 1.8,
                            )),
                        Text(
                          label,
                          style: AppText.small.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 24,
                width: 24,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: AppColors.secondary)),
                child: SvgPicture.asset(
                  AppIcons.ic_arrow_right,
                  color: AppColors.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
