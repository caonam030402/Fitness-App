import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      height: 24,
      width: 44,
      toggleSize: 14,
      inactiveColor: AppColors.gray_3,
      activeColor: AppColors.secondary,
      value: _switchValue,
      onToggle: (value) {
        setState(() {
          _switchValue = value;
        });
      },
    );
  }
}
