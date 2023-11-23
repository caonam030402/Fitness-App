import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/grid_list_item.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/switchingphoto.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/pages/progressTracker/progressTracker/progress_tracker_page.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: 'Result',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.paddingBothSidesPage),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SwitchingPhoto(),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
        child: Button(
          onPressed: () {},
          text: 'Back to Home',
        ),
      ),
    );
  }
}
