import 'package:fitness_app/components/bar_indicator.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/toggle_switch.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/workout/settingMusic/widgets/card_music.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingMusic extends StatefulWidget {
  const SettingMusic({super.key});

  @override
  State<SettingMusic> createState() => _SettingMusicState();
}

class _SettingMusicState extends State<SettingMusic> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          // Image(image: AssetImage('assets/img/avt_child.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Student', style: TextStyle(color: Color(0xffEDAC02))),
                Text('Management', style: TextStyle(color: Color(0xff002184))),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter keyword to find out...',
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
