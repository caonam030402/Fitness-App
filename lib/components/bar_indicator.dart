import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

enum Direction { horizontal, vertical }

class BarIndicator extends StatefulWidget {
  const BarIndicator({
    Key? key,
    this.isLabelPercent = false,
    this.isSizeTextPercentSmall = false,
    this.height,
    this.width,
    required this.percent,
    this.header,
    this.footer,
    this.circularRadius,
    this.headerStyle,
    this.footerStyle,
    this.animationDuration,
    this.gradient,
    this.direction = Direction.vertical,
    this.isBorderRadiusCenter = true,
    this.color,
  }) : super(key: key);

  final Color? color;

  final bool isLabelPercent;

  final bool isSizeTextPercentSmall;

  final bool isBorderRadiusCenter;

  ///Height of the indicator. Default is 120.
  final double? height;

  ///Width of the indicator. Default is 20.
  final double? width;

  final Direction direction;

  ///Percentage to be displayed. Should be between 0.0 and 1.0.
  final double percent;

  ///Optional header text
  final String? header;

  ///Header text style
  final TextStyle? headerStyle;

  ///Optional footer text
  final String? footer;

  ///Header text style
  final TextStyle? footerStyle;

  ///Color of the indicator. Default is green.
  final Gradient? gradient;

  ///Border radius of the indicator. Default is 20.
  final double? circularRadius;

  ///Animation duration. Default is 2 seconds.
  final Duration? animationDuration;

  @override
  State<BarIndicator> createState() => _BarIndicatorState();
}

class _BarIndicatorState extends State<BarIndicator> {
  double _height = 0;
  double _width = 0;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(
        const Duration(seconds: 0),
      ).then(
        (value) => setState(
          () {
            double calculateDimension(double? value, double percent) {
              return value != null ? percent * value : percent * 120;
            }

            _height = calculateDimension(widget.height, widget.percent);
            _width = calculateDimension(widget.width, widget.percent);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        widget.header != null
            ? Text(
                widget.header!,
                style: widget.headerStyle,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 5),
        SizedBox(
          height: widget.height ?? 120,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: widget.height ?? 120,
                  width: widget.width ?? 20,
                  decoration: BoxDecoration(
                    color: widget.color ?? AppColors.gray_3.withOpacity(0.4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        widget.circularRadius ?? 20,
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      curve: Curves.linear,
                      duration: widget.animationDuration ??
                          const Duration(
                            seconds: 2,
                          ),
                      width: widget.direction != Direction.vertical
                          ? widget.width ?? 20
                          : _width,
                      height: widget.direction != Direction.horizontal
                          ? widget.width ?? 20
                          : _height,
                      decoration: BoxDecoration(
                        gradient: widget.gradient,
                        borderRadius: widget.isBorderRadiusCenter == true
                            ? BorderRadius.circular(
                                widget.circularRadius ?? 20,
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: widget.isLabelPercent && widget.percent > 0.05
                            ? Text(
                                '${((widget.percent * 100).toInt()).toString()}%',
                                style: widget.isSizeTextPercentSmall == false
                                    ? const TextStyle(
                                        color: AppColors.white, fontSize: 12)
                                    : const TextStyle(
                                        color: AppColors.white, fontSize: 10),
                              )
                            : const SizedBox.shrink(),
                      ))
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        widget.footer != null
            ? Text(
                widget.footer!,
                style: widget.footerStyle,
                textAlign: TextAlign.center,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 5)
      ],
    );
  }
}