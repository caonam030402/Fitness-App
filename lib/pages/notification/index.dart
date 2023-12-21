import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/pages/notification/widgets/notification_item.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: 'Notification'),
      body: Padding(
        padding: EdgeInsets.only(
          top: AppStyles.paddingBothSidesPage - 10,
          right: AppStyles.paddingBothSidesPage,
          left: AppStyles.paddingBothSidesPage,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              final notification = listNotification[index];
              return NotificationItem(
                notification: notification,
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                color: AppColors.gray_3,
              );
            },
            itemCount: listNotification.length),
      ),
    );
  }
}

class NotificationClass {
  String title;
  String desc;
  String image;
  NotificationClass({
    required this.title,
    required this.desc,
    required this.image,
  });
}

List<NotificationClass> listNotification = [
  NotificationClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Fullbody Workout'),
  NotificationClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  NotificationClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  NotificationClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout'),
  NotificationClass(
      desc: '180 Calories Burn | 20minutes',
      image: '',
      title: 'Lowerbody Workout')
];
