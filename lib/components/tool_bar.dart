import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isBackHome;

  const ToolBar(
      {super.key, required this.title, this.actions, this.isBackHome = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: AppStyles.paddingBothSidesPage,
          left: AppStyles.paddingBothSidesPage,
          bottom: 13),
      child: Column(
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => {
                  isBackHome
                      ? Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.main)
                      : Navigator.pop(context)
                },
                child: Container(
                  padding: const EdgeInsets.all(7),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: AppColors.gray_3.withOpacity(0.4)),
                  child: SvgPicture.asset(
                    AppIcons.ic_back,
                    color: AppColors.black,
                  ),
                ),
              ),
              Text(
                title,
                style: AppText.large.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.black),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: AppColors.gray_3.withOpacity(0.4)),
                child: SvgPicture.asset(
                  AppIcons.ic_menu,
                  // ignore: deprecated_member_use
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
