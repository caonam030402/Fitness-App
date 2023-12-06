import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/pages/progressTracker/comparison/widgets/comparison_item.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 63 * comparisonItems.length.toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: comparisonItems.length,
                    itemBuilder: (context, index) {
                      final item = comparisonItems[index];
                      return ComparisonItem(
                        title: item.title,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

List<ComparisonItem> comparisonItems = [
  const ComparisonItem(
    title: 'Select Month 1',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 1',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 1',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 1',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 1',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
  const ComparisonItem(
    title: 'Select Month 2',
  ),
];
