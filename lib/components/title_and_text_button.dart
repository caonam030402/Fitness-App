import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class TitleAndTextButton extends StatelessWidget {
  final String title;
  final String textButton;
  final void Function()? onPressed;
  const TitleAndTextButton(
      {super.key,
      required this.title,
      required this.textButton,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppText.large
              .copyWith(fontWeight: FontWeight.w600, color: AppColors.black),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: AppText.small.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.gray_2),
            ))
      ],
    );
  }
}
