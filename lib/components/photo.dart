import 'package:fitness_app/components/grid_list_item.dart';
import 'package:fitness_app/pages/progressTracker/progress_tracker_page.dart';
import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
          GridListItem(item: ListItem, title: 'Front Facing'),
        ],
      ),
    );
  }
}
