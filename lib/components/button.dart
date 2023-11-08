import 'dart:ui';

import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final text;
  final onPressed;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradian,
        borderRadius: BorderRadius.all(Radius.circular(99)),
        boxShadow: [
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
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(99)))),
        child: Text(text,
            style: AppText.large.copyWith(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
