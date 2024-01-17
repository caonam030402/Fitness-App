import 'package:fitness_app/components/toggle_switch.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSection extends StatelessWidget {
  final String icon;
  final String label;
  final bool isToggle;
  final Function()? onTap;
  const AccountSection({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 21,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      margin: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(icon),
                    ),
                    Text(
                      label,
                      style: AppText.small.copyWith(
                          color: AppColors.gray_1, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            isToggle == false
                ? Container(
                    height: 18,
                    width: 18,
                    padding: EdgeInsets.all(1),
                    child: SvgPicture.asset(
                      AppIcons.ic_arrow_right,
                      color: AppColors.gray_1,
                    ))
                : ToggleSwitch()
          ],
        ),
      ),
    );
  }
}
