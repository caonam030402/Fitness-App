import 'package:fitness_app/components/drop_down_button.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

enum TypeAction { seeMore, select }

class TitleSection extends StatelessWidget {
  final String title;
  final bool hiddenAction;
  final void Function()? onPressed;
  final TypeAction typeAction;
  const TitleSection({
    super.key,
    required this.title,
    this.onPressed,
    this.hiddenAction = false,
    this.typeAction = TypeAction.seeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppText.large
              .copyWith(fontWeight: FontWeight.w600, color: AppColors.black),
        ),
        Visibility(
          visible: !hiddenAction,
          child: TextButton(
              onPressed: onPressed,
              child: typeAction == TypeAction.seeMore
                  ? Text(
                      'See More',
                      style: AppText.small.copyWith(
                          fontWeight: FontWeight.w500, color: AppColors.gray_2),
                    )
                  : DropDownButton(
                      listItem: list,
                    )),
        )
      ],
    );
  }
}

const List<String> list = <String>['Breakfast', 'Two', 'Three', 'Four'];
