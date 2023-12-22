import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width -
          (AppStyles.paddingBothSidesPage * 2),
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                blurStyle: BlurStyle.solid,
                color: AppColors.black.withOpacity(0.07)),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width -
                (AppStyles.paddingBothSidesPage * 2) -
                65,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Pancake',
                hintStyle: AppText.small.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.gray_3),
                icon: SvgPicture.asset(
                  AppIcons.ic_search_stroke,
                  color: AppColors.gray_2,
                  height: 20,
                ),
              ),
            ),
          ),
          Container(
            height: 20,
            width: 1,
            color: AppColors.gray_3,
          ),
          SizedBox(
            width: 49,
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(20, 20))),
              child: SvgPicture.asset(
                AppIcons.ic_filter,
                height: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
