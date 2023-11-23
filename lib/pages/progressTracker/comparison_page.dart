import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/comparison_item.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
          child: Button(text: 'Compare', onPressed: () {}),
        ),
        appBar: ToolBar(title: 'Comparison'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppStyles.paddingBothSidesPage),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView(
                    children: [
                      ComparisonItem(
                        title: 'Select Month 1',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 1',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 1',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 1',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 1',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      ComparisonItem(
                        title: 'Select Month 2',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.15,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
