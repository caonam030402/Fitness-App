import 'package:flutter/material.dart';

class CustomClipPathIntro1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPathIntro2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0012800, size.height * -0.0080296);
    path_0.lineTo(size.width * 1.0006933, size.height * -0.0043350);
    path_0.quadraticBezierTo(size.width * 1.0000267, size.height * 0.2922660,
        size.width * 1.0006933, size.height * 0.3500739);
    path_0.cubicTo(
        size.width * 0.4961600,
        size.height * 0.3300616,
        size.width * 0.4664800,
        size.height * 0.2697167,
        size.width * -0.0040533,
        size.height * 0.4683005);
    path_0.quadraticBezierTo(size.width * -0.0040533, size.height * 0.3482882,
        size.width * 0.0012800, size.height * -0.0080296);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPathIntro3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0120533, size.height * -0.0031034);
    path_0.lineTo(size.width * 1.0113600, size.height * 0.0005911);
    path_0.quadraticBezierTo(size.width * 1.0257333, size.height * 0.7887685,
        size.width * 1.0237333, size.height * 0.8428818);
    path_0.cubicTo(
        size.width * 0.6392000,
        size.height * 0.8179433,
        size.width * 0.3310400,
        size.height * 0.0677340,
        size.width * -0.0156000,
        size.height * 0.7432635);
    path_0.quadraticBezierTo(size.width * -0.0156000, size.height * 0.6232512,
        size.width * -0.0120533, size.height * -0.0031034);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPathIntro4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0120533, size.height * -0.0021000);
    path_0.lineTo(size.width * 1.0113600, size.height * 0.0004000);
    path_0.quadraticBezierTo(size.width * 1.0153867, size.height * 0.8927000,
        size.width * 1.0133867, size.height * 0.9293167);
    path_0.cubicTo(
        size.width * 0.5497600,
        size.height * 0.9606583,
        size.width * 0.2409867,
        size.height * 0.8517000,
        size.width * -0.0078133,
        size.height * 0.5796167);
    path_0.quadraticBezierTo(size.width * -0.0078133, size.height * 0.4984083,
        size.width * -0.0120533, size.height * -0.0021000);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
