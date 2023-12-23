import 'package:flutter/material.dart';

class AppColors {
  static const white = (Color(0xffffffff));
  static const black = (Color(0xff1F212C));
  static const primary = (Color(0xff6A67E8));
  static const secondary = (Color(0xffC58BF2));
  static const primaryGradiant = LinearGradient(
      colors: [Color.fromARGB(255, 114, 111, 240), Color(0xff6A67E8)]);
  static const secondaryGradiant =
      LinearGradient(colors: [Color(0xffC58BF2), Color(0xffC58BF2)]);
  static const whiteGradiant = LinearGradient(colors: [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 255, 255, 255)
  ]);
  static const progressBarGradiant =
      LinearGradient(colors: [Color(0xff92A3FD), Color(0xffC58BF2)]);
  static const border = Color(0xffF7F8F8);
  static const gray_1 = Color(0xff7B6F72);
  static const gray_2 = Color(0xffADA4A5);
  static const gray_3 = Color(0xffDDDADA);
  static const red = Color(0xffFF0000);
  static const green = Color(0xff42D742);
}
