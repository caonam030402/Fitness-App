import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputTextWithElement extends StatelessWidget {
  final TextInputType? keyboardType;
  final icon;
  final lable;
  final unit;
  final bool hiddenValue;
  const InputTextWithElement({
    super.key,
    required this.lable,
    required this.icon,
    this.hiddenValue = false,
    this.keyboardType,
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width -
                  (AppStyles.PaddingBothSidesPage * 2) - 58,
              decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: SvgPicture.asset(icon),
                  ),
                  Expanded(
                      child: TextField(
                    obscureText: hiddenValue,
                    keyboardType: keyboardType,
                    decoration: InputDecoration(
                        hintText: lable,
                        hintStyle: AppText.small.copyWith(
                            height: 2,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_2),
                        border: InputBorder.none),
                  )),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), gradient: AppColors.secondaryGradian),
              child: Center(child: Text(unit, style: AppText.small.copyWith(fontWeight: FontWeight.w500, color: AppColors.white,))),
            ),
          ],
        )
      ],
    );
  }
}
