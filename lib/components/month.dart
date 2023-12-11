import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Month extends StatefulWidget {
  const Month({super.key});

  @override
  State<Month> createState() => _MonthState();
}

class _MonthState extends State<Month> {
  late var nowDate;
  late var nextDate;
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    nowDate = DateFormat('MMM').format(date);
    nextDate =
        DateFormat('MMM').format(DateTime(date.year, date.month + 1, date.day));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
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
                      nowDate = DateFormat('MMM').format(selectedDate);
                      nextDate = DateFormat('MMM').format(
                          DateTime(date.year, date.month + 1, date.day));
                    });
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  elevation: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(nowDate,
                      style: AppText.large.copyWith(
                          color: AppColors.gray_1,
                          fontWeight: FontWeight.w600)),
                  Text(nextDate,
                      style: AppText.large.copyWith(
                          color: AppColors.gray_1,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            )),
      ],
    );
  }
}
