import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class BorderOr extends StatelessWidget {
  const BorderOr({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const Expanded(
            child: Divider(thickness: 1, color: AppColors.gray_3),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Or',
              style: AppText.small.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.black),
            ),
          ),
          const Expanded(
            child: Divider(thickness: 1, color: AppColors.gray_3),
          ),
        ],
      ),
    );
  }
}
