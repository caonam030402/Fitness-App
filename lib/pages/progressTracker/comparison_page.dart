import 'package:fitness_app/components/comparison_item.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar(title: 'Comparison'),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.paddingBothSidesPage),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
                    child: ListView(
                      children: [
                        ComparisonItem(
                          title: 'Select Month 1',
                        ),
                        ComparisonItem(
                          title: 'Select Month 2',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
