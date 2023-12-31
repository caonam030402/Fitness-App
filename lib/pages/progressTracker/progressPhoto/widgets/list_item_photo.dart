import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class ListItemPhoto extends StatelessWidget {
  final String date;
  final dynamic item;
  const ListItemPhoto({super.key, required this.date, this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: AppText.small
                .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray_1),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: item == 0 ? 0 : item.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: Image.asset(
                      item[index],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
