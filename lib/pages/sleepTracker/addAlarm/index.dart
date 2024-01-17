import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/month_card.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AddAlarmPage extends StatelessWidget {
  const AddAlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: 'Add Alarm'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.paddingBothSidesPage),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 63 * monthCardItem.length.toDouble(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: monthCardItem.length,
                itemBuilder: (context, index) {
                  final item = monthCardItem[index];
                  return MonthCard(
                    title: item.title,
                    icon: item.icon,
                    label: item.label,
                  );
                },
              ),
            ),
            const MonthCard(
              title: 'vibrate When Alarm Sound',
              icon: AppIcons.ic_vibrate,
              isHiddenLabelAndIconRight: true,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
        child: Button(text: 'Add', onPressed: () {}),
      ),
    );
  }
}

class MonthCardItem {
  String label;
  String icon;
  String title;
  MonthCardItem({required this.label, required this.icon, required this.title});
}

List<MonthCardItem> monthCardItem = [
  MonthCardItem(label: '09:00 PM', icon: AppIcons.ic_bed, title: 'Bedtime'),
  MonthCardItem(
      label: '8hours 30minutes',
      icon: AppIcons.ic_time,
      title: 'Hours of sleep'),
  MonthCardItem(label: 'Mon to Fri', icon: AppIcons.ic_repeat, title: 'Repeat'),
];
