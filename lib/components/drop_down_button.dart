import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const List<String> list = <String>['Breakfast', 'Two', 'Three', 'Four'];

class DropDownButton extends StatefulWidget {
  final List<String> listItem;
  const DropDownButton({super.key, required this.listItem});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 35,
      decoration: BoxDecoration(
          gradient: AppColors.primaryGradiant,
          borderRadius: BorderRadius.circular(50)),
      child: DropdownButton<String>(
          underline: Container(),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          dropdownColor: AppColors.primary,
          icon: SvgPicture.asset(
            AppIcons.ic_down,
            color: AppColors.white,
          ),
          value: dropdownValue,
          items: widget.listItem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppText.small.copyWith(color: AppColors.white),
              ),
            );
          }).toList()),
    );
  }
}
