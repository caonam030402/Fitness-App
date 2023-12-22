import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CustomStep extends StatelessWidget {
  final String number;
  final String step;
  final String content;
  final bool isRead;
  const CustomStep(
      {super.key,
      required this.number,
      required this.step,
      required this.content,
      this.isRead = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                number,
                style: AppText.large.copyWith(
                    fontWeight: FontWeight.w400,
                    color: isRead == false
                        ? AppColors.gray_2
                        : AppColors.secondary,
                    height: 1.7),
              ),
              Column(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.only(bottom: 5, top: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: isRead == false
                              ? AppColors.gray_2
                              : AppColors.secondary,
                        ),
                        color: AppColors.white,
                        shape: BoxShape.circle),
                    child: Container(
                      height: 10,
                      width: 10,
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isRead == false
                            ? AppColors.gray_2
                            : AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Dash(
                    direction: Axis.vertical,
                    length:
                        TextSelectionToolbar.kToolbarContentDistanceBelow + 50,
                    dashLength: 5,
                    dashColor: isRead == false
                        ? AppColors.gray_2
                        : AppColors.secondary,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            bottom: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'step $step',
                  style: AppText.large.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      height: 1.7),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  content,
                  style: AppText.small.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray_1,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
