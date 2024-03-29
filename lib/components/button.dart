import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Size size;
  final color;
  final TextStyle? textStyle;
  final String text;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      this.size = Size.large,
      this.color = AppColors.primaryGradiant,
      this.textStyle,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    SizeButton resuldSizeButton(Size size) {
      SizeButton resultSize;
      if (size == Size.large) {
        resultSize = SizeButton(60, MediaQuery.of(context).size.width, 0,
            AppText.large.copyWith(fontWeight: FontWeight.w700));
      } else if (size == Size.medium) {
        resultSize = SizeButton(
            35, null, 8, AppText.caption.copyWith(fontWeight: FontWeight.w600));
      } else {
        resultSize = SizeButton(
            30,
            null,
            4,
            AppText.medium
                .copyWith(fontWeight: FontWeight.w400, color: AppColors.white));
      }

      return resultSize;
    }

    SizeButton sizeButton = resuldSizeButton(size);

    return Container(
      padding: padding == padding
          ? padding
          : EdgeInsets.symmetric(horizontal: sizeButton.padding),
      width: sizeButton.width,
      height: sizeButton.height,
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: const BorderRadius.all(Radius.circular(99)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(96, 146, 164, 253),
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(99)))),
        child: Text(text, style: textStyle ?? sizeButton.textStyle),
      ),
    );
  }
}

enum Size { large, medium, small }

class SizeButton {
  late double height;
  late double? width;
  late double padding;
  late TextStyle textStyle;

  SizeButton(this.height, this.width, this.padding, this.textStyle);
}
