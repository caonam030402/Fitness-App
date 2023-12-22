import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ButtonMonth extends StatefulWidget {
  const ButtonMonth({super.key});

  @override
  State<ButtonMonth> createState() => _ButtonMonthState();
}

class _ButtonMonthState extends State<ButtonMonth> {
  late var dateNow;
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateNow = date;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 167,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dateNow = DateTime(
                          dateNow.year, dateNow.month - 1, dateNow.day);
                    });
                  },
                  child: Container(
                    height: 22,
                    width: 22,
                    padding: const EdgeInsets.all(2),
                    color: AppColors.border,
                    child: SvgPicture.asset(
                      AppIcons.ic_back,
                      color: AppColors.gray_2,
                    ),
                  ),
                ),
                Text(DateFormat('MMM yyyy').format(dateNow),
                    style: AppText.medium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray_2,
                    )),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dateNow = DateTime(
                          dateNow.year, dateNow.month + 1, dateNow.day);
                    });
                  },
                  child: Container(
                    height: 22,
                    width: 22,
                    padding: const EdgeInsets.all(2),
                    color: AppColors.border,
                    child: SvgPicture.asset(
                      AppIcons.ic_arrow_right,
                      color: AppColors.gray_2,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
