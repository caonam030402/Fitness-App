import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/pages/progressTracker/comparison/widgets/comparison_item.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            bottom: AppStyles.paddingBothSidesPage,
            left: AppStyles.paddingBothSidesPage,
            right: AppStyles.paddingBothSidesPage,
          ),
          child: Button(text: 'Compare', onPressed: () {}),
        ),
        appBar: const ToolBar(title: 'Comparison'),
        body: Padding(
          padding: const EdgeInsets.all(AppStyles.paddingBothSidesPage),
          child: Column(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.71,
                  child: ListView(
                    children: const [
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
