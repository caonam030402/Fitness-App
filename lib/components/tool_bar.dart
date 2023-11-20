import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const ToolBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.paddingBothSidesPage),
      child: Column(
        children: [
          Spacer(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Container(
                    padding: EdgeInsets.all(7),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
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
                  padding: EdgeInsets.all(10),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.gray_3.withOpacity(0.4)),
                  child: SvgPicture.asset(
                    AppIcons.ic_menu,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(45);
}
