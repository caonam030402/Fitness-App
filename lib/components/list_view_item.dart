import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String date;
  final dynamic item;
  const ListViewItem({super.key, required this.date, this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: AppText.small
              .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray_1),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: item == 0 ? 0 : item.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(item[index]),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
