import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonthCard extends StatefulWidget {
  final String title;
  const MonthCard({super.key, required this.title});

  @override
  State<MonthCard> createState() => _MonthCardState();
}

class _MonthCardState extends State<MonthCard> {
  late var label;
  DateTime date = DateTime.now();
  @override
  void initState() {
    super.initState();
    label = DateFormat('MMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: Column(
        children: [
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(16)),
            child: ElevatedButton(
              onPressed: () async {
                await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2030),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    setState(() {
                      date = selectedDate;
                      label = DateFormat('MMM').format(selectedDate);
                    });
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.white,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(99)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ic_calendar,
                              height: 18, color: AppColors.gray_1),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.title,
                            style: AppText.small.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray_1),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            label,
                            style: AppText.caption.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray_2),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(AppIcons.ic_arrow_right,
                              height: 18, color: AppColors.gray_2),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
