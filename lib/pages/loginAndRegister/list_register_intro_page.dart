import 'package:fitness_app/components/register_intro_page.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:flutter/material.dart';

class ListRegisterIntroPage extends StatefulWidget {
  const ListRegisterIntroPage({super.key});

  @override
  State<ListRegisterIntroPage> createState() => _ListRegisterIntroPageState();
}

class _ListRegisterIntroPageState extends State<ListRegisterIntroPage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: listRegisterIntroItem.length,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            final item = listRegisterIntroItem[index];
            return RegisterIntroPage(
              indexPage: index + 1,
              image: item.image,
              title: item.title,
              desc: item.desc,
              controller: _controller,
            );
          }),
    );
  }
}

class RegisterIntroItem {
  String image;
  String title;
  String desc;
  RegisterIntroItem(
      {required this.title, required this.desc, required this.image});
}

List<RegisterIntroItem> listRegisterIntroItem = [
  RegisterIntroItem(
      image: AppIcons.vt_weightlifting,
      title: "Improve Shape",
      desc:
          "I have a low amount of body fat and need / want to build more muscle"),
  RegisterIntroItem(
      image: AppIcons.vt_rope_skipping,
      title: "Lean & Tone",
      desc:
          "I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way"),
  RegisterIntroItem(
      image: AppIcons.vt_jogging,
      title: "Lose a Fat",
      desc:
          "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass")
];
