import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String desc;
  final String illustration;
  const CustomDialog(
      {super.key,
      required this.title,
      required this.titleStyle,
      required this.desc,
      required this.illustration});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusCard),
        contentPadding: EdgeInsets.all(30),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: AppStyles.paddingCard,
                child: SvgPicture.asset(
                  illustration,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: titleStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                desc.toString(),
                style: AppText.medium.copyWith(color: AppColors.gray_1),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                text: 'Back',
                size: Size.medium,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                textStyle: AppText.medium,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          )
        ]);
  }
}
