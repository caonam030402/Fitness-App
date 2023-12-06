import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class GridListItem extends StatelessWidget {
  final item;
  final String title;
  const GridListItem({super.key, required this.item, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppText.medium
                .copyWith(color: AppColors.gray_1, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 170,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: item == 0 ? 0 : item.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      item[index],
                      fit: BoxFit.cover,
                    ));
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
