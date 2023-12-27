import 'package:fitness_app/components/toggle_switch.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Schedule extends StatefulWidget {
  final String time;
  final String icon;
  final String label;
  final String hour;
  const Schedule({
    super.key,
    required this.icon,
    required this.label,
    required this.time,
    required this.hour,
  });

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: AppStyles.borderRadiusCard,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Container(
                  height: 93,
                  width: MediaQuery.of(context).size.width,
                  padding: AppStyles.paddingCard,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppStyles.borderRadiusCard),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        widget.icon,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: widget.label,
                                style: AppText.medium.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                                children: [
                                  TextSpan(
                                    text: widget.time,
                                    style: AppText.small.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.gray_1,
                                    ),
                                  ),
                                ]),
                          ),
                          Text(
                            widget.hour,
                            style: AppText.small.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray_1,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [ToggleSwitch()],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppIcons.ic_more),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
