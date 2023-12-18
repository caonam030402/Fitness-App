import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/notification/index.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  final NotificationClass notification;
  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(100))),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: AppText.medium.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                notification.desc,
                style: AppText.small.copyWith(color: AppColors.gray_1),
              )
            ],
          ),
          Spacer(),
          SvgPicture.asset(
            AppIcons.ic_more,
            width: 15,
          )
        ],
      ),
    );
  }
}
