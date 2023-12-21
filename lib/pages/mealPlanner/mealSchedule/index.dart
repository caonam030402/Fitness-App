import 'package:fitness_app/components/tool_bar.dart';
import 'package:flutter/material.dart';

class MealSchedule extends StatelessWidget {
  const MealSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: 'Meal Schedule'),
      body: Column(children: [
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: Column(
            children: [],
          ),
        )
      ]),
    );
  }
}
