import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/configs/app_routes.dart';
import 'package:fitness_app/pages/progressTracker/result/widgets/switchingphoto.dart';
import 'package:fitness_app/components/tool_bar.dart';
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
      appBar: const ToolBar(
        title: 'Result',
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const SwitchingPhoto(),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
        child: Button(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.camera);
          },
          text: 'Back to Home',
        ),
      ),
    );
  }
}
