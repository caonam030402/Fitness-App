import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MealCard extends StatefulWidget {
  final String icon;
  final String title;
  final String label;
  const MealCard({
    super.key,
    required this.icon,
    required this.title,
    required this.label,
  });

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool notifications = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: AppStyles.borderRadiusCard,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Container(
              height: 93,
              width: MediaQuery.of(context).size.width,
              padding: AppStyles.paddingCard,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppStyles.borderRadiusCard),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    widget.icon,
                    height: 42,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: AppText.medium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Text(
                        widget.label,
                        style: AppText.small.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray_1,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        notifications = !notifications;
                      });
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(26, 26)),
                    ),
                    child: SvgPicture.asset(
                      notifications
                          ? AppIcons.ic_notifications
                          : AppIcons.ic_turn_off_notifications,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
